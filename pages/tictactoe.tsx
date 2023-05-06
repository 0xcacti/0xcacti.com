import type { NextPage } from "next";
import { useCallback, useState } from "react";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import Link from "next/link";
import TicTacToeBoard from "../components/TicTacToeBoard";
import contractConfig from "../contracts/TicTacToe.json";

import { erc721ABI, useContractWrite, usePrepareContractWrite } from "wagmi";

const TicTacToe: NextPage = () => {
    const [tokenURI, setTokenURI] = useState(0);
    const refreshData = useCallback(() => {
        setTokenURI((tokenURI) => tokenURI + 1);
    }, []);

    const { config } = usePrepareContractWrite({
        address: contractConfig.address as `0x${string}`,
        abi: contractConfig.abi,
        functionName: "createNewGame",
        args: [
            "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266",
            "0x70997970C51812dc3A010C7d01b50e0d17dc79C8",
        ],
    });

    const { data, isLoading, isSuccess, write } = useContractWrite(config);

    return (
        <div className="bg-white border min-h-screen">
            <div className="container flex justify-between px-6 py-10 container mx-auto">
                <Link href="/projects">
                    <a className="text-xl font-bold text-gray-800 md:text-2xl hover:text-red">
                        Projects
                    </a>
                </Link>
                <ConnectButton />
            </div>
            <div className="flex flex-row h-screen border border-red mx-auto justify-center">
                <div
                    className="flex flex-col  h-2/3 w-1/3"
                    style={{ height: "600px", width: "600px" }}
                >
                    <TicTacToeBoard
                        refreshData={refreshData}
                        tokenID={tokenURI}
                    />
                </div>
                <div className="flex flex-col space-y-16 justify-center text-center p-5 h-2/3">
                    <button
                        disabled={!write}
                        onClick={() => {
                            console.log(write);
                            write?.();
                        }}
                    >
                        {isLoading && (
                            <div> console.log(JSON.stringify(data));</div>
                        )}
                        {isLoading && <div>Check Wallet</div>}
                        {isSuccess && (
                            <div>Transaction: {JSON.stringify(data)}</div>
                        )}
                        <div className="bg-blue p-2 rounded-lg">
                            <h1 className="text-xl font-bold">New Game</h1>
                        </div>
                    </button>
                    <button onClick={refreshData}>
                        <div className="bg-red p-2 rounded-lg">
                            <h1 className="text-xl font-bold">Find Game</h1>
                        </div>
                    </button>
                    <button>
                        <div className="bg-blue p-2 rounded-lg">
                            <h1 className="text-xl font-bold">Mint Game</h1>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    );
};

export default TicTacToe;
