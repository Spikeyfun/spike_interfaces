module spike_amm::flash_loan_router {
    use supra_framework::coin::{Coin};
    use supra_framework::fungible_asset::{FungibleAsset, Metadata};
    use supra_framework::object::{Object};
    
    use spike_amm::amm_pair;
    use spike_amm::coin_wrapper;
    // amm_controller no se usa en las firmas, solo se usaba en la lógica interna, 
    // así que no es estrictamente necesario importarlo aquí, pero no hace daño dejarlo.
    use spike_amm::amm_controller;

    // --- STRUCTS ---
    
    // Definimos el struct tal cual, ya que se usa en los valores de retorno.
    // Como es un recibo de Flash Loan, no debería tener abilities (Hot Potato),
    // a menos que el diseño original permita almacenarlo.
    struct FlashLoanFromPoolAsCoinReceipt<phantom CoinType> {
        pair_receipt: amm_pair::FlashLoanReceipt,
        loan_amount: u64
    }
    
    // ===================================================================
    // 1. "WHALE" SCENARIO: Withdrawal from Wrapper
    // =================================================================

    public fun borrow_from_vault<CoinType>(
        _amount: u64
    ): (Coin<CoinType>, coin_wrapper::FlashLoanReceipt<CoinType>) {
        abort 0
    }

    public fun repay_to_vault<CoinType>(
        _payment: Coin<CoinType>,
        _receipt: coin_wrapper::FlashLoanReceipt<CoinType>
    ) {
        abort 0
    }

    public fun borrow_from_pool_as_coin<CoinType>(
        _pair: Object<amm_pair::Pair>,
        _amount: u64
    ): (Coin<CoinType>, FlashLoanFromPoolAsCoinReceipt<CoinType>) {
        abort 0
    }

    public fun repay_to_pool_as_coin<CoinType>(
        _payment: Coin<CoinType>,
        _receipt: FlashLoanFromPoolAsCoinReceipt<CoinType>,
        _pair: Object<amm_pair::Pair>
    ) {
        abort 0
    }

    // ===================================================================
    // 2. "POOL" SCENARIO: Withdrawal from AMM Pool
    // =================================================================

    public fun borrow_fa_from_pool(
        _pair: Object<amm_pair::Pair>,
        _token: Object<Metadata>,
        _amount: u64
    ): (FungibleAsset, amm_pair::FlashLoanReceipt) {
        abort 0
    }

    public fun repay_fa_to_pool(
        _pair: Object<amm_pair::Pair>,
        _payment: FungibleAsset,
        _receipt: amm_pair::FlashLoanReceipt
    ) {
        abort 0
    }

    #[view]
    public fun expected_fee(_amount: u64): u64 {
        abort 0
    }

    #[view]
    public fun max_flash_loan_vault<CoinType>(): u64 {
        abort 0
    }

    #[view]
    public fun max_flash_loan_pool(_pair: Object<amm_pair::Pair>, _token: Object<Metadata>): u64 {
        abort 0
    }
}