# Generate ssh key
if [[ ! -f "~/.ssh/id_rsa.pub" ]]; then

echo 'Creating new SSH key...'

ssh-keygen -t rsa -b 4096 -C "mhbakke@gmail.com"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
echo '\n'
cat ~/.ssh/id_rsa.pub
echo '\n'

read \?"Add ssh key to GitHub etc. Press [Enter] to continue."

fi
