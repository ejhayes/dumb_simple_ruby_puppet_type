class puppet_debian_package( $packaging_root, $install='install' ) {
	class puppet_debian_package::install { "$packaging_root/$install": }
}