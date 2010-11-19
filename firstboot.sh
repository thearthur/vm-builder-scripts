#!/bin/bash
set +x
sudo dpkg-reconfigure tzdata
return 0

#install clojure
mkdir ~/opt
cd ~/opt
git clone git://github.com/clojure/clojure.git
cd clojure
ant
mkdir ~/.clojure
cp clojure.jar ~/.clojure

#install clojure-contrib
cd ~/opt 
git clone git://github.com/clojure/clojure-contrib.git 
cd clojure-contrib 
mvn package 
cp target/clojure-contrib*.jar ~/.clojure/clojure-contrib.jar

#setup bash clj alias
echo <<EOF >> ~/.bashrc
export CLOJURE_EXT=~/.clojure
export PATH=$PATH:~/opt/clojure-contrib/launchers/bash
alias clj=clj-env-dir
EOF

#emacs setup

cd ~/opt
git clone git://github.com/nablaone/slime.git

cd ~/opt 
git clone git://github.com/technomancy/clojure-mode.git 

cd ~/opt
mkdir leiningen
cd leiningen
wget http://github.com/technomancy/leiningen/raw/stable/bin/lein

echo 'export PATH=$PATH:~/opt/leiningen' >> ~/.bashrc
chmod +x lein
./lein self-install

mv -f ~/.emacs.d ~/.emacs.d.bak
git clone http://github.com/eschulte/emacs-starter-kit.git .emacs.d
cd ~/.emacs.d/
git submodule init
git submodule update
cd src/org/
make
cd ../../
git checkout -b my-emacs-changes
#skip latex stuff

echo <<EOF >> ~/.emacs/init.el
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