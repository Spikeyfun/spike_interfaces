module spike_amm::price_aggregator {

    #[view]
    native public fun get_token_price_in_usd(token_address: address): (u128, u16) {
    };

    #[view]
    native public fun get_coin_price_in_usd<CoinType>(): (u128, u16) {
    };
}