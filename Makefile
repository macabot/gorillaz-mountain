# Directory Configuration
SRC_DIR   := src
SCORES_DIR:= $(SRC_DIR)/scores
PARTS_DIR := $(SRC_DIR)/parts
BUILD_DIR := build
DIST_DIR  := dist

DIST_PDF_DIR := $(DIST_DIR)/pdf
DIST_SVG_DIR := $(DIST_DIR)/svg
DIST_MP3_DIR := $(DIST_DIR)/mp3

# Output Naming Prefix
PREFIX := macabot-gorillaz-mountain

# Default cache location for downloaded SoundFonts
SF2_CACHE_DIR := $(HOME)/.cache/soundfonts
DEFAULT_SF2 := $(SF2_CACHE_DIR)/TimbresOfHeaven4.00.sf2

# Allow override via environment variable or command line
SOUNDFONT ?= $(DEFAULT_SF2)

# Translation Mapping (Single Words)
DUTCH_flute       := dwarsfluit
DUTCH_recorder    := blokfluit
DUTCH_drum        := trommel
DUTCH_shaker      := shaker
DUTCH_harp        := harp
DUTCH_piano       := piano
DUTCH_guitar      := gitaar
DUTCH_voice       := zang
DUTCH_violin      := viool
DUTCH_cello       := cello
DUTCH_all         := arrangement

ENG_dwarsfluit  := flute
ENG_blokfluit   := recorder
ENG_trommel     := drum
ENG_shaker      := shaker
ENG_harp        := harp
ENG_piano       := piano
ENG_gitaar      := guitar
ENG_zang        := voice
ENG_viool       := violin
ENG_cello       := cello
ENG_arrangement := all

empty :=
space := $(empty) $(empty)

# Functions to translate hyphen-separated stems (e.g. flute-cello -> dwarsfluit-cello)
translate_word = $(or $(DUTCH_$(1)),$(1))
reverse_word   = $(or $(ENG_$(1)),$(1))

to_dutch = $(subst $(space),-,$(strip $(foreach w,$(subst -, ,$(1)),$(call translate_word,$(w)))))
get_eng  = $(subst $(space),-,$(strip $(foreach w,$(subst -, ,$(1)),$(call reverse_word,$(w)))))

# Find score files
SCORES         := $(wildcard $(SCORES_DIR)/score-*.ly)
RAW_BASENAMES  := $(notdir $(basename $(SCORES)))
PART_NAMES     := $(patsubst score-%,%,$(RAW_BASENAMES))

# Target names with prefix
PREFIXED_BASENAMES := $(foreach p,$(PART_NAMES),$(PREFIX)-$(call to_dutch,$(p)))

# Find all Mermaid diagram files and translate target names
DIAGRAMS             := $(wildcard $(SRC_DIR)/diagrams/*.mmd)
RAW_DIAGRAM_NAMES    := $(notdir $(basename $(DIAGRAMS)))
TARGET_DIAGRAMS      := $(foreach d,$(RAW_DIAGRAM_NAMES),$(DIST_SVG_DIR)/$(PREFIX)-$(call to_dutch,$(d)).svg)

# Target Files
TARGET_PDFS := $(patsubst %, $(DIST_PDF_DIR)/%.pdf, $(PREFIXED_BASENAMES))
TARGET_SVGS := $(patsubst %, $(DIST_SVG_DIR)/%.svg, $(PREFIXED_BASENAMES)) $(TARGET_DIAGRAMS)
TARGET_MP3S := $(patsubst %, $(DIST_MP3_DIR)/%.mp3, $(PREFIXED_BASENAMES))

# Function: Parse dependencies dynamically
define get_deps
$(SRC_DIR)/global.ly \
$(if $(filter score-all score-arrangement,$(1)),\
    $(wildcard $(PARTS_DIR)/*.ly),\
    $(patsubst %,$(PARTS_DIR)/%.ly,$(subst -, ,$(patsubst score-%,%,$(1))))\
)
endef

.PHONY: all pdfs svgs mp3s clean dirs

# Default Target
all: dirs prune pdfs svgs mp3s

pdfs: $(TARGET_PDFS)
svgs: $(TARGET_SVGS)
mp3s: $(TARGET_MP3S)

# Order-Only Directory Creation
dirs: | $(BUILD_DIR) $(DIST_PDF_DIR) $(DIST_SVG_DIR) $(DIST_MP3_DIR)

$(BUILD_DIR) $(DIST_PDF_DIR) $(DIST_SVG_DIR) $(DIST_MP3_DIR):
	@mkdir -p $@

# Remove stale files in dist/ that are no longer targets
prune:
	@echo "=== Checking for stale files in dist/ ==="
	@for file in $$(find $(DIST_DIR) -type f 2>/dev/null); do \
		if ! echo "$(TARGET_PDFS) $(TARGET_SVGS) $(TARGET_MP3S)" | grep -q "$$file"; then \
			echo "Removing stale cached file: $$file"; \
			rm -f "$$file"; \
		fi \
	done

.SECONDEXPANSION:

# Compile PDF & MIDI
$(DIST_PDF_DIR)/$(PREFIX)-%.pdf $(BUILD_DIR)/$(PREFIX)-%.midi: $(SCORES_DIR)/score-$$(call get_eng,%).ly $$(call get_deps,score-$$(call get_eng,%)) | $(BUILD_DIR) $(DIST_PDF_DIR)
	@echo "=== Compiling PDF & MIDI: $< ==="
	lilypond -o $(BUILD_DIR)/$(PREFIX)-$* $<
	@mv $(BUILD_DIR)/$(PREFIX)-$*.pdf $(DIST_PDF_DIR)/$(PREFIX)-$*.pdf

# Compile SVG (Single Continuous SVG for Web)
$(DIST_SVG_DIR)/$(PREFIX)-%.svg: $(SCORES_DIR)/score-$$(call get_eng,%).ly $$(call get_deps,score-$$(call get_eng,%)) | $(BUILD_DIR) $(DIST_SVG_DIR)
	@echo "=== Compiling SVG: $< ==="
	lilypond -dbackend=svg -dcrop -o $(BUILD_DIR)/$(PREFIX)-$* $<
	@mv $(BUILD_DIR)/$(PREFIX)-$*.cropped.svg $@

# Direct download link for Timbres of Heaven
# See https://www.midkar.com/SoundFonts/index.html
SF2_URL := https://www.midkar.com/SoundFonts/Timbres%20of%20Heaven%20(XGM)%204.00(G).7z

# Download and unpack .7z SoundFont if missing
$(SOUNDFONT):
	@mkdir -p $(dir $@)
	@echo "=== SoundFont not found at $@. Downloading .7z archive... ==="
	curl -L -o "$@.7z" "$(SF2_URL)"
	@echo "=== Extracting SoundFont... ==="
	@mkdir -p "$(dir $@)temp_sf2"
	7z x "$@.7z" -o"$(dir $@)temp_sf2" -y
	@mv $(dir $@)temp_sf2/*.sf2 "$@"
	@rm -rf "$@.7z" "$(dir $@)temp_sf2"
	@echo "=== SoundFont successfully extracted to $@ ==="

# Synthesize MP3 from MIDI
$(DIST_MP3_DIR)/%.mp3: $(BUILD_DIR)/%.midi $(SOUNDFONT) | $(BUILD_DIR) $(DIST_MP3_DIR)
	@echo "=== Synthesizing MP3: $@ ==="
	fluidsynth -ni $(SOUNDFONT) $< -F $(BUILD_DIR)/$*_temp.wav -r 44100
	ffmpeg -y -i $(BUILD_DIR)/$*_temp.wav -b:a 192k $@
	@rm -f $(BUILD_DIR)/$*_temp.wav

# Compile Mermaid Diagrams to SVG via Mermaid Ink API
$(DIST_SVG_DIR)/$(PREFIX)-%.svg: $(SRC_DIR)/diagrams/$$(call get_eng,%).mmd | $(DIST_SVG_DIR)
	@echo "=== Compiling Mermaid Diagram (via Mermaid Ink API): $< ==="
	curl -s "https://mermaid.ink/svg/$$(python3 -c "import base64; print(base64.b64encode(open('$<', 'rb').read()).decode('utf-8'))")" -o "$@"

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
