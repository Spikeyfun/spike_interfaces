module spike_amm::amm_oracle {
  use supra_framework::fungible_asset::{Metadata};
  use supra_framework::object::{Object};
  use spike_amm::amm_pair::{Pair};

  native public entry fun initialize(sender: &signer, anchor_token: Object<Metadata>);

  #[view]
  native public fun is_initialized(): bool;

  native public fun update(tokenA: Object<Metadata>, tokenB: Object<Metadata>): bool;

  native public fun update_block_info(): bool;

  #[view]
  native public fun get_quantity_v2(token: Object<Metadata>, amount: u64): u128;

  #[view]
  native public fun get_average_price_v2(token: Object<Metadata>): u128;

  #[view]
  native public fun get_current_price(token: Object<Metadata>): u128;

  #[view]
  native public fun get_lp_token_value_v2(lp_token: Object<Pair>, amount: u64): u128;

  #[view]
  native public fun get_anchor_token(): Object<Metadata>;

  #[view]
  native public fun get_average_block_time(): u64;

  native public entry fun add_router_token(sender: &signer, token: Object<Metadata>);

  native public entry fun remove_router_token(sender: &signer, token: Object<Metadata>);

  #[view]
  native public fun get_router_token_length(): u64;

  #[view]
  native public fun is_router_token(token: Object<Metadata>): bool;

  #[view]
  native public fun get_router_token(index: u64): Object<Metadata>;

  #[view]
  native public fun get_router_token_address(index: u64): address;
}
