function asdf_ruby_version() {
	if asdf current ruby &> /dev/null; then
		echo "‹rb: $(asdf current ruby | sed -e "s/ \{0,4\}(set.*$//")›"
	else
		echo '‹rb: sys›'
	fi
}

function asdf_python_version() {
	if asdf current python &> /dev/null; then
		echo "‹py: $(asdf current python | sed -e "s/ \{0,4\}(set.*$//")›"
	else
		echo '‹py: sys›'
	fi
}

function asdf_nodejs_version() {
	if asdf current nodejs &> /dev/null; then
		echo "‹n: $(asdf current nodejs | sed -e "s/ \{0,4\}(set.*$//")›"
	else
		echo '‹n: sys›'
	fi
}

function postgresql_status() {
	if lsof -i:5432 &> /dev/null; then
		if lsof -i:5432 | grep docke &> /dev/null; then
			echo '‹pg: docker›'
		else
			echo '‹pg: local›'
		fi
	fi
}

function redis_status() {
	if lsof -i:6379 &> /dev/null; then
		if lsof -i:6379 | grep docke &> /dev/null; then
			echo '‹redis: docker›'
		else
			echo '‹redis: local›'
		fi
	fi
}