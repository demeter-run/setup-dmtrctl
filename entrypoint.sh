#!/bin/sh

set -e

main() {
	os=$(uname -s)
	arch=$(uname -m)
	version=${1:-latest}

	if [ "$version" == "latest" ]; then
		echo "using latest version"
		download_uri="https://github.com/demeter-run/cli/releases/latest/download/dmtrctl-${os}-${arch}.tar.gz"
	else
		echo "using version ${version}"
		download_uri="https://github.com/demeter-run/cli/releases/download/${version}/dmtrctl-${os}-${arch}.tar.gz"
	fi

	echo "downloading binary from ${download_uri}"
	bin_dir="${HOME}/bin"
	tmp_dir="${HOME}/tmp"
	exe="$bin_dir/dmtrctl"
	simexe="$bin_dir/dmtr"

	mkdir -p "$bin_dir"
	mkdir -p "$tmp_dir"

	curl -q --fail --location --output "$tmp_dir/dmtrctl.tar.gz" "$download_uri"
	
    echo "unpacking downloaded file ${tmp_dir}"
	tar -C "$tmp_dir" -xzf "$tmp_dir/dmtrctl.tar.gz"
	chmod +x "$tmp_dir/dmtrctl"
	
	# atomically rename into place:
    echo "moving binary to final location ${exe}"
	mv "$tmp_dir/dmtrctl" "$exe"
	#rm "$tmp_dir/dmtrctl.tar.gz"

    ls -al "$bin_dir"

	ln -sf $exe $simexe

	# print version
	#"$exe" --version
	
	echo "dmtrctl was installed successfully to $exe"
	
    echo "\$HOME/bin" >> $GITHUB_PATH
}

main "$1"