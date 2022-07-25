echo ============================ BREW [NON ADMIN] =============================
mkdir -p ~/bin
cd ~/bin
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"

brew --version
brew update # update brew itself
brew upgrade # update packages (installed programs)

echo ================================ OH-MY-ZSH ================================
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo ================================ DEV TOOLS ================================

echo **** AWS CLI ****
brew install awscli
aws --version

echo **** GIT ****
brew install git
git config --global user.name "PauliusU"
git config --global user.email "48020370+PauliusU@users.noreply.github.com"
git --version

echo **** MongoDB compass ****
brew install mongodb-compass

echo **** Python [Python 3] ****
brew install python # defaults to python3
python3 --version

echo **** Visual studio code [VSCode] ****
brew install visual-studio-code
code -v

echo **** VOLTA ****
volta -v

echo ============================= OTHER TOOLS =================================

echo ================================= ZSH =====================================
echo "
export BREW_HOME="$HOME/bin/homebrew"
export VOLTA_HOME="$HOME/.volta"
export PATH="$BREW_HOME/bin:$VOLTA_HOME/bin:$PATH"
" >>~/.zshrc && source ~/.zshrc
