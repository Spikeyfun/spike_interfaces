module spike_amm::package_manager {
    use std::string::String;

    native public fun address_exists(name: String): bool;

    native public fun get_address(name: String): address;

}