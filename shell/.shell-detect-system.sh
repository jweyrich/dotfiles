detect_system () {
	test -z "$DETECTED_SYSTEM" && {
		case "$(uname -s)" in
			Linux)
				DETECTED_SYSTEM="linux"
			;;
			Darwin)
				DETECTED_SYSTEM="macosx"
			;;
			MINGW*|CYGWIN*)
				DETECTED_SYSTEM="cygwin"
			;;
			*)
				case "$TERM" in
					cygwin)
						DETECTED_SYSTEM="cygwin"
					;;
					*)
						>&2 echo ".shell-detect-system.sh failed to detect which system is running"
						return 0
					;;
				esac
			;;
		esac
		export DETECTED_SYSTEM
	}
	return 1
}

detect_system

is_cygwin () {
	test "$DETECTED_SYSTEM" = "cygwin"
}

is_macosx () {
	test "$DETECTED_SYSTEM" = "macosx"
}
