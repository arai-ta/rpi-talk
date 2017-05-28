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

volume-control:
	alsamixer

