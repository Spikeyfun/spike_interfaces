module spike_amm::amm_controller {

  #[view]
  native public fun get_signer_address(): address;

  #[view]
  native public fun get_swap_fee(): u8;

  #[view]
  native public fun get_fee_to(): address;

  #[view]
  native public fun get_admin(): address;

  #[view]
  native public fun get_fee_on(): address;

  #[view]
  native public fun get_flash_loan_fee_bps(): u64;

  native public fun assert_paused();

  native public fun assert_unpaused();

}
