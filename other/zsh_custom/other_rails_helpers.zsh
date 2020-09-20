function scf() {
	case $1 in
		l | loc | local | d | dev | development )
			if [[ "$2" == "db" ]]; then
				psql -h localhost -p 5432 -d scf-platform_development -U scf
			elif [[ "$2" == "bash" ]]; then
				cd /Users/phillipgray/code/scf
			else
				cd /Users/phillipgray/code/scf; bundle exec rails console
			fi
			;;
		s | stage | staging )
			if [[ "$2" == "db" ]]; then
				heroku pg:psql -a scf-staging
			elif [[ "$2" == "bash" ]]; then
				heroku run bash -a scf-staging
			else
				heroku console -a scf-staging
			fi
			;;
		p | prod | production )
			if [[ "$2" == "db" ]]; then
				heroku pg:psql -a scf-production
			elif [[ "$2" == "bash" ]]; then
				heroku run bash -a scf-production
			else
				heroku console -a scf-production
			fi
			;;
		<0-10000> )
			if [[ "$2" == "db" ]]; then
				heroku pg:psql -a scf-staging-pr-"$1"
			elif [[ "$2" == "bash" ]]; then
				heroku run bash -a scf-staging-pr-"$1"
			else
				heroku console -a scf-staging-pr-"$1"
			fi
			;;
		*)
			echo "Oops. You didn't pass a useful argument to the method."
			echo "Acceptable arguments:"
			echo "scf l | loc | local | d | dev | development "
			echo "scf s | stage | staging "
			echo "scf p | prod | production "
			echo "scf <pr-number> for review app"
			echo "db can be added as a second argument to open a psql console in that environment"

	esac
}
