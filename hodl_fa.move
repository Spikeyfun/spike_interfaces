module spike_fun::hodl_fa {
    use std::option::{Option};
    use std::string::{String};

    use supra_framework::fungible_asset::{FungibleAsset};
    use aptos_token::token::{Token};

    struct PoolIdentifier has copy, drop, store {
        creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    }

    struct NFTBoostConfig has store {
        boost_percent: u128,
        collection_owner: address,
        collection_name: String,
    }

    native public fun create_boost_config(
        collection_owner: address,
        collection_name: String,
        boost_percent: u128
    ): NFTBoostConfig;

    native public fun register_pool(
        caller: &signer,
        stake_addr: address,
        reward_addr: address,     
        initial_reward_amount: u64,         
        duration: u64,                      
        nft_boost_config: Option<NFTBoostConfig>
    );

    native public fun register_hodl_pool(
        caller: &signer,
        stake_addr: address,
        reward_addr: address,
        unstake_period_seconds: u64,
        nft_boost_config: Option<NFTBoostConfig>,
    );
    
    native public fun stake(
        user: &signer,
        pool_key: PoolIdentifier,
        stake_amount: u64
    );

    native public fun unstake(
        user: &signer,
        pool_key: PoolIdentifier,
        amount: u64
    ): FungibleAsset;

    native public fun deposit_and_stake_for_beneficiary( 
        caller_signer: &signer,
        pool_key: PoolIdentifier,
        beneficiary_addr: address,
        stake_asset: FungibleAsset
    );

    native public fun harvest(
        user: &signer,
        pool_key: PoolIdentifier
    ): (u64, FungibleAsset);

    native public fun boost(
        user: &signer, 
        pool_key: PoolIdentifier,
        nft: Token
    );

    native public fun remove_boost(
        user: &signer, 
        pool_key: PoolIdentifier
    ): Token;

    native public fun remove_boost_many(
        user: &signer,
        pool_keys: vector<PoolIdentifier>
    );

    native public fun finalize_hodl_pool_rewards(
        caller_signer: &signer,
        pool_key: PoolIdentifier,
        total_reward_amount: u64
    );

    native public fun enable_emergency(
        admin: &signer, 
        pool_key: PoolIdentifier
    );

    native public fun unstake_many(
        user: &signer,
        pool_keys: vector<PoolIdentifier>
    );

    native public fun harvest_many(
        user: &signer,
        pool_keys: vector<PoolIdentifier>
    );

    native public fun emergency_unstake(
        user: &signer, 
        pool_key: PoolIdentifier
    ): (u64, Option<FungibleAsset>, Option<Token>);

    native public fun withdraw_to_treasury(
        treasury_signer: &signer,
        pool_key: PoolIdentifier,
        amount: u64
    ): FungibleAsset;
    
    native public entry fun set_treasury_withdraw_grace_period(
        admin_signer: &signer,
        new_period: u64
    );

    native public entry fun set_pool_registration_fee(
        admin_signer: &signer,
        new_fee_amount: u64,
        new_fee_treasury_address: address
    );

    native public entry fun set_linked_contract_address(
        admin_signer: &signer,
        whitelisted_addr: address
    );

    native public entry fun propose_new_admin(
        current_admin_signer: &signer,
        new_candidate_addr: address
    );

    native public entry fun accept_admin_role(
        candidate_signer: &signer
    );

    #[view]
    native public fun get_start_timestamp(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address
    ): u64;

    #[view]
    native public fun is_boostable(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): bool;

    #[view]
    native public fun get_boost_config(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): (address, String, u128);

    #[view]
    native public fun is_finished(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): bool;

    #[view]
    native public fun get_end_timestamp(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): u64;

    #[view]
    native public fun get_unlocked_stake_amount(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
        user_addr: address
    ): u64;

    #[view]
    native public fun pool_exists(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): bool;

    #[view]
    native public fun stake_exists(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
        user_addr: address
    ): bool;

    #[view]
    native public fun get_pool_total_stake(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): u64;

    #[view]
    native public fun get_pool_total_boosted(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): u128;

    #[view]
    native public fun get_user_stake_or_zero(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
        user_addr: address
    ): u64;

    #[view]
    native public fun is_boosted(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
        user_addr: address
    ): bool;
    
    #[view]
    native public fun get_user_boosted(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
        user_addr: address
    ): u128;

    #[view]
    native public fun get_pending_user_rewards(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
        user_addr: address
    ): u64;

    #[view]
    native public fun is_emergency(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): bool;

    #[view]
    native public fun is_local_emergency(
        pool_creator_addr: address,
        stake_addr: address,
        reward_addr: address,
    ): bool;

    #[view]
    native public fun get_module_resource_address(): address;

    #[view]
    native public fun new_pool_identifier(
        creator_addr: address,
        stake_addr: address,
        reward_addr: address
    ): PoolIdentifier;

    #[view]
    native public fun get_treasury_withdraw_grace_period(): u64;

    #[view]
    native public fun get_current_admin(): address;

    #[view]
    native public fun get_pending_admin_candidate(): Option<address>;

    #[view]
    native public fun get_pool_registration_fee_config(): (u64, address);

    #[view]
    native public fun get_user_staked_pools(user_addr: address): vector<PoolIdentifier>;

    #[view]
    native public fun get_user_boosted_pools(user_addr: address): vector<PoolIdentifier>;

}