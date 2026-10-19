#!/bin/bash

# This script should be run as sudo!
set -euo pipefail

DOTFILES_DIR="${1:-$HOME/.dotfiles}"
THEME_SOURCE=https://github.com/stepanzubkov/where-is-my-sddm-theme.git
THEME_DIR=where_is_my_sddm_theme
SDDM_THEMES_DIR=/usr/share/sddm/themes
SDDM_CONFIG_PATH=/etc/sddm.conf.d/theme.conf

die() {
    echo -e "\e[31;02m$1\e[0m" >&2
    exit 1
}

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

git clone --depth 1 "$THEME_SOURCE" "$TMP_DIR/theme" || die "Failed to fetch git repo at $THEME_SOURCE."

rm -rf "${SDDM_THEMES_DIR:?}/${THEME_DIR}"
cp -r "$TMP_DIR/theme/${THEME_DIR}" "$SDDM_THEMES_DIR" || die "Failed to copy theme to $SDDM_THEMES_DIR."

cp "${DOTFILES_DIR}/config/sddm/theme.conf" "${SDDM_THEMES_DIR}/${THEME_DIR}/theme.conf"
cp "${DOTFILES_DIR}/assets/wallpapers/forest.png" "${SDDM_THEMES_DIR}/${THEME_DIR}/forest.png"

mkdir -p "$(dirname "$SDDM_CONFIG_PATH")"
printf '[Theme]\nCurrent=%s\n' "$THEME_DIR" > "$SDDM_CONFIG_PATH" || die "Failed to write to $SDDM_CONFIG_PATH."

echo -e "\e[32;02mTheme successfully installed!\e[0m"
