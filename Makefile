#! /usr/bin/make -f

# source
# http://qiita.com/lutecia16v/items/8d220885082e40ace252

sound-config:
	amixer controls

sound-out:
	amixer cget numid=3
	# values=0 : automatic
	# values=1 : analog out
	# values=2 : HDMI

sound-out-set:
	@: $${V:?value required}
	amixer cset numid=3 ${V}

sound-config-save:
	sudo alsactl store

sound-test:
	aplay /usr/share/sounds/alsa/*

volume-control:
	alsamixer

jtalk-install:
	if dpkg -l open-jtalk ; then echo "Already installed" ; exit 1 ; fi
	sudo apt install \
		open-jtalk \
		open-jtalk-mecab-naist-jdic \
		hts-voice-nitech-jp-atr503-m001

at-install:
	sudo apt install at

#aquestalkpi-install:
/usr/local/bin/AquesTalkPi:
	curl -L 'http://www.a-quest.com/cgi-bin/download.php?download=1&readed=yes' \
		> aquestalkpi.tgz
	tar xvfz aquestalkpi.tgz
	sudo cp -pr aquestalkpi/{AquesTalkPi,aq_dic} /usr/local/bin

voice: /usr/local/bin/AquesTalkPi
	@: $${V:?value required}
	/usr/local/bin/AquesTalkPi ${V} | aplay -q

