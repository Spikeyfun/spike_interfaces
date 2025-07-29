module spike_amm::amm_zap {

  #[view]
  native public fun is_initialized(): bool;

  /*
  * @notice Zap SUPRA in a SUPRA pool (e.g. SUPRA/token)
  * @param _lpToken: LP token address (e.g. RZR/SUPRA)
  * @param _tokenAmountOutMin: minimum token amount (e.g. RZR) to receive in the intermediary swap (e.g. SUPRA --> RZR)
  */
  native public entry fun zap_in_supra(
    sender: &signer,
    lp_token: address,
    amount_in: u64,
    token_amount_out_min: u64,
  );

  /*
  * @notice Zap a token in (e.g. token/other token)
  * @param _tokenToZap: token to zap
  * @param _tokenAmountIn: amount of token to swap
  * @param _lpToken: LP token address (e.g. RZR/USDT)
  * @param _tokenAmountOutMin: minimum token to receive (e.g. RZR) in the intermediary swap (e.g. USDT --> RZR)
  */
  native public entry fun zap_in_token(
    sender: &signer,
    token_to_zap: address,
    token_amount_in: u64,
    lp_token: address,
    token_amount_out_min: u64,
  );

  /*
  * @notice Zap two tokens in, rebalance them to 50-50, before adding them to LP
  * @param _token0ToZap: address of token0 to zap
  * @param _token1ToZap: address of token1 to zap
  * @param _token0AmountIn: amount of token0 to zap
  * @param _token1AmountIn: amount of token1 to zap
  * @param _lpToken: LP token address (token0/token1)
  * @param _tokenAmountInMax: maximum token amount to sell (in token to sell in the intermediary swap)
  * @param _tokenAmountOutMin: minimum token to receive in the intermediary swap
  * @param _isToken0Sold: whether token0 is expected to be sold (if false, sell token1)
  */
  native public entry fun zap_in_token_rebalancing(
    sender: &signer,
    token0_to_zap: address,
    token1_to_zap: address,
    token0_amount_in: u64,
    token1_amount_in: u64,
    lp_token: address,
    token_amount_in_max: u64,
    token_amount_out_min: u64,
    is_token0_sold: bool,
  );

  native public entry fun zap_in_supra_rebalancing(
    sender: &signer,
    token1_to_zap: address,
    supra_amount_in: u64,
    token1_amount_in: u64,
    lp_token: address,
    token_amount_in_max: u64,
    token_amount_out_min: u64,
    is_token0_sold: bool,
  );

  native public entry fun zap_out_supra(
    sender: &signer,
    lp_token: address,
    lp_token_amount: u64,
    token_amount_out_min: u64,
  );

  native public entry fun zap_out_token(
    sender: &signer,
    lp_token: address,
    token_to_receive: address,
    lp_token_amount: u64,
    token_amount_out_min: u64,
  );

  native public entry fun update_max_zap_reserve_ratio(
    sender: &signer,
    max_zap_reserve_ratio: u64,
  );

  #[view]
  native public fun estimate_zap_in_swap(
    token_to_zap: address,
    token_amount_in: u64,
    lp_token: address
  ): (u64, u64, address);

  #[view]
  native public fun estimate_zap_in_rebalancing_swap(
    token0_to_zap: address,
    token1_to_zap: address,
    token0_amount_in: u64,
    token1_amount_in: u64,
    lp_token: address,
  ): (u64, u64, bool);

  #[view]
  native public fun estimate_zap_out_swap(
    lp_token: address,
    lp_token_amount: u64,
    token_to_receive: address,
  ): (u64, u64, address);

}
