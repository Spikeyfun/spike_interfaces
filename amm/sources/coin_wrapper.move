
module spike_amm::coin_wrapper {
    use supra_framework::fungible_asset::{Metadata};
    use supra_framework::object::{Object};
    use std::string::{String};

    #[view]
    native public fun is_initialized(): bool;

    #[view]
    native public fun wrapper_address(): address;

    #[view]
    native public fun is_supported<CoinType>(): bool;

    #[view]
    native public fun is_wrapper(metadata: Object<Metadata>): bool;

    #[view]
    native public fun get_coin_type(metadata: Object<Metadata>): String;
    #[view]
    native public fun get_wrapper<CoinType>(): Object<Metadata>;

    #[view]
    native public fun get_original(fungible_asset: Object<Metadata>): String;

    #[view]
    native public fun format_fungible_asset(fungible_asset: Object<Metadata>): String;
}
