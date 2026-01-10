module spike_amm::flash_loan_router {
    use supra_framework::coin::{Coin};
    use supra_framework::fungible_asset::{FungibleAsset, Metadata};
    use supra_framework::object::{Object};
    
    // IMPORTANT: Ensure that 'amm_pair.move' and 'coin_wrapper.move' 
    // in your GitHub repository also match EXACTLY what is deployed on Mainnet.
    use spike_amm::amm_pair;
    use spike_amm::coin_wrapper;

    // --- STRUCTS ---
    
    // This struct must be IDENTICAL byte-for-byte to the deployed contract.
    // If you change the field order or remove 'phantom', it will cause TYPE_MISMATCH.
    struct FlashLoanFromPoolAsCoinReceipt<phantom CoinType> {
        pair_receipt: amm_pair::FlashLoanReceipt,
        loan_amount: u64
    }
    
    // ===================================================================
    // PUBLIC FUNCTIONS (INTERFACES)
    // ===================================================================

    // 1. "WHALE" SCENARIO: Withdrawal from Wrapper (Vault)
    
    public fun borrow_from_vault<CoinType>(
        amount: u64
    ): (Coin<CoinType>, coin_wrapper::FlashLoanReceipt<CoinType>) {
        abort 0
    }

    public fun repay_to_vault<CoinType>(
        payment: Coin<CoinType>,
        receipt: coin_wrapper::FlashLoanReceipt<CoinType>
    ) {
        abort 0
    }

    // 2. "HYBRID" SCENARIO: Borrow from Pool, receive Coin
    
    public fun borrow_from_pool_as_coin<CoinType>(
        pair: Object<amm_pair::Pair>,
        amount: u64
    ): (Coin<CoinType>, FlashLoanFromPoolAsCoinReceipt<CoinType>) {
        abort 0
    }

    public fun repay_to_pool_as_coin<CoinType>(
        payment: Coin<CoinType>,
        receipt: FlashLoanFromPoolAsCoinReceipt<CoinType>,
        pair: Object<amm_pair::Pair>
    ) {
        abort 0
    }

    // 3. "POOL" SCENARIO: Withdrawal from AMM Pool (Pure FA)

    public fun borrow_fa_from_pool(
        pair: Object<amm_pair::Pair>,
        token: Object<Metadata>,
        amount: u64
    ): (FungibleAsset, amm_pair::FlashLoanReceipt) {
        abort 0
    }

    public fun repay_fa_to_pool(
        pair: Object<amm_pair::Pair>,
        payment: FungibleAsset,
        receipt: amm_pair::FlashLoanReceipt
    ) {
        abort 0
    }

    // ===================================================================
    // VIEW FUNCTIONS
    // ===================================================================

    #[view]
    public fun expected_fee(_amount: u64): u64 {
        abort 0
    }

    #[view]
    public fun max_flash_loan_vault<CoinType>(): u64 {
        abort 0
    }

    #[view]
    public fun max_flash_loan_pool(
        _pair: Object<amm_pair::Pair>, 
        _token: Object<Metadata>
    ): u64 {
        abort 0
    }
}
