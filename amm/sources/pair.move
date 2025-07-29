module spike_amm::amm_pair {
  use supra_framework::fungible_asset::{FungibleStore, MintRef, BurnRef, TransferRef, Metadata};
  use supra_framework::object::{Object};
  
  struct LPTokenRefs has store {
    burn_ref: BurnRef,
    mint_ref: MintRef,
    transfer_ref: TransferRef,
  }

  #[resource_group_member(group = supra_framework::object::ObjectGroup)]
  struct Pair has key {
    token0: Object<FungibleStore>,
    token1: Object<FungibleStore>,
    lp_token_refs: LPTokenRefs,
    block_timestamp_last: u64,
    price_0_cumulative_last: u128,
    price_1_cumulative_last: u128,
    k_last: u128,
    locked: bool,
  }

  #[view]
  native public fun get_reserves(pair: Object<Pair>): (u64, u64, u64);

  #[view]
  native public fun get_k_last(pair: Object<Pair>): u128;

  #[view]
  native public fun get_cumulative_prices(pair: Object<Pair>): (u128, u128);

  #[view]
  native public fun price_0_cumulative_last(pair: Object<Pair>): u128;

  #[view]
  native public fun price_1_cumulative_last(pair: Object<Pair>): u128;

  #[view]
  native public fun balance0(pair: Object<Pair>): u64;
  #[view]
  native public fun balance1(pair: Object<Pair>): u64;

  #[view]
  native public fun token0(pair: Object<Pair>): Object<Metadata>;

  #[view]
  native public fun token1(pair: Object<Pair>): Object<Metadata>;

  #[view]
  native public fun balance_of(pair: Object<Pair>, token: Object<Metadata>): u64;

  #[view]
  native public fun unpack_pair(pair: Object<Pair>): (Object<Metadata>, Object<Metadata>);

  #[view]
  native public fun lp_token_supply(pair: Object<Pair>): u128;

  #[view]
  native public fun lp_balance_of(account: address, pair: Object<Pair>): u64;

  #[view]
  native public fun liquidity_pool(
    token0: Object<Metadata>,
    token1: Object<Metadata>,
  ): Object<Pair>;

  #[view]
  native public fun liquidity_pool_address_safe(
    token0: Object<Metadata>,
    token1: Object<Metadata>,
  ): (bool, address);

  #[view]
  native public fun liquidity_pool_address(
    token0: Object<Metadata>,
    token1: Object<Metadata>
  ): address;

}
