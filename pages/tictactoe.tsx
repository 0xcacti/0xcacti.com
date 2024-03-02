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

    const handleSubmitNewGame = (e: React.FormEvent) => {
        e.preventDefault();
        // Handle form submission here
    };

    const handleSubmitFindGame = (e: React.FormEvent) => {
        e.preventDefault();
        // Handle form submission here
    };

    const handleSubmitMintGame = (e: React.FormEvent) => {
        e.preventDefault();
        // Handle form submission here
    };

    const [showPopup1, setShowPopup1] = useState(false);
    const [showPopup2, setShowPopup2] = useState(false);
    const [showPopup3, setShowPopup3] = useState(false);

    const openPopupOneAndCloseOthers = () => {
        setShowPopup1(!showPopup1);
        setShowPopup2(false);
        setShowPopup3(false);
    };

    const openPopupTwoAndCloseOthers = () => {
        setShowPopup1(false);
        setShowPopup2(!showPopup2);
        setShowPopup3(false);
    };
    const openPopupThreeAndCloseOthers = () => {
        setShowPopup1(false);
        setShowPopup2(false);
        setShowPopup3(!showPopup3);
    };

    // const { data, isLoading, isSuccess, write } = useContractWrite(config);

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
                <div className="flex flex-col justify-center items-start h-full w-2/3 border border-red">
                    <TicTacToeBoard
                        refreshData={function (): void {
                            throw new Error("Function not implemented.");
                        }}
                        tokenID={0}
                    />
                </div>
                <GameOptions />
            </div>
        </div>
    );
};

export default TicTacToe;
