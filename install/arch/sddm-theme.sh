#!/bin/bash

# This script should be run as sudo!
THEME_SOURCE=https://github.com/stepanzubkov/where-is-my-sddm-theme.git
THEME_DIR=where_is_my_sddm_theme
SDDM_THEMES_DIR=/usr/share/sddm/themes
SDDM_CONFIG_PATH=/usr/lib/sddm/sddm.conf.d/theme.conf

git clone $THEME_SOURCE .theme_temp || (echo -e "\e31;02mFailed to fetch git repo at $THEME_SOURCE.\e[0m" && exit 1)

cp -rv .theme_temp/${THEME_DIR} $SDDM_THEMES_DIR || (echo -e "\e31;02mFailed to copy theme to $SDDM_THEMES_DIR!\e[0m" && rm -rf .theme_temp && exit 1)
rm -rf .theme_temp

rm "${SDDM_THEMES_DIR}/${THEME_DIR}/theme.conf"
cp "${HOME}/.dotfiles/config/sddm/theme.conf" "${SDDM_THEMES_DIR}/${THEME_DIR}/theme.conf"
cp "${HOME}/.dotfiles/assets/wallpapers/forest.png" "${SDDM_THEMES_DIR}/${THEME_DIR}/forest.png"

echo -e "[Theme]\nCurrent=${THEME_DIR}" > ${SDDM_CONFIG_PATH} || (echo -e "\e[31;02mFailed to write to ${SDDM_CONFIG_PATH}.\e[0m" && exit 1)

echo -e "\e[32;02mTheme successfully installed!\e[0m"
