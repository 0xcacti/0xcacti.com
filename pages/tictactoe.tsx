import type { NextPage } from "next";
import { useCallback, useState } from "react";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import Link from "next/link";
import TicTacToeBoard from "../components/TicTacToeBoard";
import contractConfig from "../contracts/TicTacToe.json";
import GameOptions from "../components/GameOptions";

import { useContractWrite, usePrepareContractWrite } from "wagmi";

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
        <div className="bg-white flex flex-col justify-start min-h-screen min-w-screen border border-red">
            <div className="w-full flex justify-between py-10 border border-blue p-5">
                <Link href="/projects">
                    <a className="text-xl font-bold text-gray-800 md:text-2xl hover:text-red">
                        Projects
                    </a>
                </Link>
                <ConnectButton />
            </div>
            <div className="flex flex-row h-screen border border-red justify-start">
                <div className="flex flex-col h-full w-2/3 border border-red">
                    <TicTacToeBoard
                        refreshData={refreshData}
                        tokenID={tokenURI}
                    />
                    test
                </div>
                <GameOptions />
            </div>
        </div>
    );
};

export default TicTacToe;
