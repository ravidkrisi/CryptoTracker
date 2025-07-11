//
//  CoinDetailModel.swift
//  Crypto
//
//  Created by Ravid Krisi on 30/10/2024.
//

import Foundation

// JSON DATA
/*
 URL:
 https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false
 
 URLResponse:
 {"id":"bitcoin","symbol":"btc","name":"Bitcoin","web_slug":"bitcoin","asset_platform_id":null,"platforms":{"":""},"detail_platforms":{"":{"decimal_place":null,"contract_address":""}},"block_time_in_minutes":10,"hashing_algorithm":"SHA-256","categories":["Cryptocurrency","Layer 1 (L1)","FTX Holdings","Proof of Work (PoW)","Bitcoin Ecosystem","GMCI 30 Index"],"preview_listing":false,"public_notice":null,"additional_notices":[],"description":{"en":"Bitcoin is the first successful internet money based on peer-to-peer technology; whereby no central bank or authority is involved in the transaction and production of the Bitcoin currency. It was created by an anonymous individual/group under the name, Satoshi Nakamoto. The source code is available publicly as an open source project, anybody can look at it and be part of the developmental process.\r\n\r\nBitcoin is changing the way we see money as we speak. The idea was to produce a means of exchange, independent of any central authority, that could be transferred electronically in a secure, verifiable and immutable way. It is a decentralized peer-to-peer internet currency making mobile payment easy, very low transaction fees, protects your identity, and it works anywhere all the time with no central authority and banks.\r\n\r\nBitcoin is designed to have only 21 million BTC ever created, thus making it a deflationary currency. Bitcoin uses the \u003ca href=\"https://www.coingecko.com/en?hashing_algorithm=SHA-256\"\u003eSHA-256\u003c/a\u003e hashing algorithm with an average transaction confirmation time of 10 minutes. Miners today are mining Bitcoin using ASIC chip dedicated to only mining Bitcoin, and the hash rate has shot up to peta hashes.\r\n\r\nBeing the first successful online cryptography currency, Bitcoin has inspired other alternative currencies such as \u003ca href=\"https://www.coingecko.com/en/coins/litecoin\"\u003eLitecoin\u003c/a\u003e, \u003ca href=\"https://www.coingecko.com/en/coins/peercoin\"\u003ePeercoin\u003c/a\u003e, \u003ca href=\"https://www.coingecko.com/en/coins/primecoin\"\u003ePrimecoin\u003c/a\u003e, and so on.\r\n\r\nThe cryptocurrency then took off with the innovation of the turing-complete smart contract by \u003ca href=\"https://www.coingecko.com/en/coins/ethereum\"\u003eEthereum\u003c/a\u003e which led to the development of other amazing projects such as \u003ca href=\"https://www.coingecko.com/en/coins/eos\"\u003eEOS\u003c/a\u003e, \u003ca href=\"https://www.coingecko.com/en/coins/tron\"\u003eTron\u003c/a\u003e, and even crypto-collectibles such as \u003ca href=\"https://www.coingecko.com/buzz/ethereum-still-king-dapps-cryptokitties-need-1-billion-on-eos\"\u003eCryptoKitties\u003c/a\u003e."},"links":{"homepage":["http://www.bitcoin.org","",""],"whitepaper":"https://bitcoin.org/bitcoin.pdf","blockchain_site":["https://mempool.space/","https://platform.arkhamintelligence.com/explorer/token/bitcoin","https://blockchair.com/bitcoin/","https://btc.com/","https://btc.tokenview.io/","https://www.oklink.com/btc","https://3xpl.com/bitcoin","","",""],"official_forum_url":["https://bitcointalk.org/","",""],"chat_url":["","",""],"announcement_url":["",""],"twitter_screen_name":"bitcoin","facebook_username":"bitcoins","bitcointalk_thread_identifier":null,"telegram_channel_identifier":"","subreddit_url":"https://www.reddit.com/r/Bitcoin/","repos_url":{"github":["https://github.com/bitcoin/bitcoin","https://github.com/bitcoin/bips"],"bitbucket":[]}},"image":{"thumb":"https://coin-images.coingecko.com/coins/images/1/thumb/bitcoin.png?1696501400","small":"https://coin-images.coingecko.com/coins/images/1/small/bitcoin.png?1696501400","large":"https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400"},"country_origin":"","genesis_date":"2009-01-03","sentiment_votes_up_percentage":92.11,"sentiment_votes_down_percentage":7.89,"watchlist_portfolio_users":1706193,"market_cap_rank":1,"status_updates":[],"last_updated":"2024-10-30T07:09:51.306Z"}
 
 */

struct CoinDetailModel: Codable {
    let id, symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, description, links
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
    }
    
    var readableDescription: String? {
        return description?.en?.removingHTMLOccurances
    }
}

struct Links: Codable {
    let homepage: [String]?
    let subredditURL: String?
    
    enum CodingKeys: String, CodingKey {
        case homepage
        case subredditURL = "subreddit_url"
    }
}

struct Description: Codable {
    let en: String?
}
