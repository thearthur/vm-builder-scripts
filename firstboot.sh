#!/bin/bash
set -x
sudo dpkg-reconfigure tzdata
echo "time to set a real password (or prese enter to skip)"
passwd

mkdir ~/opt

#emacs setup

cd ~/opt
git clone git://github.com/nablaone/slime.git

cd ~/opt 
git clone git://github.com/technomancy/clojure-mode.git 

cd ~/opt
mkdir leiningen
cd leiningen
wget --no-check-certificate http://github.com/technomancy/leiningen/raw/stable/bin/lein
echo 'export PATH=$PATH:~/opt/leiningen' >> ~/.bashrc
chmod +x lein
./lein self-install

cd ~/opt
mkdir cake
git clone git://github.com/ninjudd/cake.git
echo 'export PATH=$PATH:~/opt/cake' >> ~/.bashrc


mv -f ~/.emacs.d ~/.emacs.d.bak
git clone http://github.com/eschulte/emacs-starter-kit.git ~/.emacs.d
cd ~/.emacs.d/
git submodule init
git submodule update
cd src/org/
make
cd ../../
git checkout -b my-emacs-changes
#skip latex stuff

cat <<EOF >> ~/.emacs.d/init.el
;; clojure-mode
(add-to-list 'load-path "~/opt/clojure-mode")
(require 'clojure-mode)

;; slime
(eval-after-load "slime" 
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path "~/opt/slime")
(require 'slime)
(slime-setup)
EOF

echo "setting up git "
git config --global user.name FULLNAME

git config --global user.email EMAIL

git add init.el
git commit -m 'initial clojure emacs configuration'

echo "you may need to log out and back in to load the profile changes"

