# Directory Configuration
SRC_DIR   := src
SCORES_DIR:= $(SRC_DIR)/scores
PARTS_DIR := $(SRC_DIR)/parts
BUILD_DIR := build
DIST_DIR  := dist

DIST_PDF_DIR := $(DIST_DIR)/pdf
DIST_SVG_DIR := $(DIST_DIR)/svg
DIST_MP3_DIR := $(DIST_DIR)/mp3

# SoundFont Location
SOUNDFONT ?= $(HOME)/TimbresOfHeaven/TimbresOfHeaven4.00.sf2

# Find all score files
SCORES    := $(wildcard $(SCORES_DIR)/score-*.ly)
BASENAMES := $(notdir $(basename $(SCORES)))

# Find all Mermaid diagram files
DIAGRAMS        := $(wildcard $(SRC_DIR)/diagrams/*.mmd)
TARGET_DIAGRAMS := $(patsubst $(SRC_DIR)/diagrams/%.mmd, $(DIST_SVG_DIR)/%.svg, $(DIAGRAMS))

# Target Files
TARGET_PDFS := $(patsubst %, $(DIST_PDF_DIR)/%.pdf, $(BASENAMES))
TARGET_SVGS := $(patsubst %, $(DIST_SVG_DIR)/%.svg, $(BASENAMES)) $(TARGET_DIAGRAMS)
TARGET_MP3S := $(patsubst %, $(DIST_MP3_DIR)/%.mp3, $(BASENAMES))

# Function: Parse dependencies dynamically
define get_deps
$(SRC_DIR)/global.ly \
$(if $(filter score-all,$(1)),\
    $(wildcard $(PARTS_DIR)/*.ly),\
    $(patsubst %,$(PARTS_DIR)/%.ly,$(subst -, ,$(patsubst score-%,%,$(1))))\
)
endef

.PHONY: all pdfs svgs mp3s clean dirs

# Default Target
all: dirs pdfs svgs mp3s

pdfs: $(TARGET_PDFS)
svgs: $(TARGET_SVGS)
mp3s: $(TARGET_MP3S)

# Order-Only Directory Creation
dirs: | $(BUILD_DIR) $(DIST_PDF_DIR) $(DIST_SVG_DIR) $(DIST_MP3_DIR)

$(BUILD_DIR) $(DIST_PDF_DIR) $(DIST_SVG_DIR) $(DIST_MP3_DIR):
	@mkdir -p $@

.SECONDEXPANSION:

# Compile PDF (also generates MIDI in build/)
$(DIST_PDF_DIR)/%.pdf $(BUILD_DIR)/%.midi: $(SCORES_DIR)/%.ly $$(call get_deps,%) | $(BUILD_DIR) $(DIST_PDF_DIR)
	@echo "=== Compiling PDF & MIDI: $< ==="
	lilypond -o $(BUILD_DIR)/$* $<
	@mv $(BUILD_DIR)/$*.pdf $(DIST_PDF_DIR)/$*.pdf

# Compile SVG (Single Continuous SVG for Web)
$(DIST_SVG_DIR)/%.svg: $(SCORES_DIR)/%.ly $$(call get_deps,%) | $(BUILD_DIR) $(DIST_SVG_DIR)
	@echo "=== Compiling SVG: $< ==="
	lilypond -dbackend=svg -dcrop -o $(BUILD_DIR)/$* $<
	@mv $(BUILD_DIR)/$*.cropped.svg $@

# Synthesize MP3 from MIDI
$(DIST_MP3_DIR)/%.mp3: $(BUILD_DIR)/%.midi | $(BUILD_DIR) $(DIST_MP3_DIR)
	@echo "=== Synthesizing MP3: $@ ==="
	fluidsynth -ni $(SOUNDFONT) $< -F $(BUILD_DIR)/$*_temp.wav -r 44100
	ffmpeg -y -i $(BUILD_DIR)/$*_temp.wav -b:a 192k $@
	@rm -f $(BUILD_DIR)/$*_temp.wav

# Compile Mermaid Diagrams to SVG via Docker
$(DIST_SVG_DIR)/%.svg: $(SRC_DIR)/diagrams/%.mmd | $(DIST_SVG_DIR)
	@echo "=== Compiling Mermaid Diagram (via Docker): $< ==="
	docker run --rm -u $(shell id -u):$(shell id -g) -v $(CURDIR):/data minlag/mermaid-cli -i /data/$< -o /data/$@ -b transparent

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
