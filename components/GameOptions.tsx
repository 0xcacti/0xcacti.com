// NewGamePopUp.tsx
import React, { useState } from "react";

const GameOptions: React.FC = () => {
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

    return (
        <div className="flex flex-col space-y-16 justify-start text-center p-5 h-full border flex-grow">
            <button onClick={openPopupOneAndCloseOthers}>
                <div className="bg-blue p-2 rounded-lg w-full h-12 flex items-center justify-center hover:bg-green transition-colors duration-200 mx-auto">
                    <h1 className="text-xl font-bold">New&nbsp;Game</h1>
                </div>
            </button>

            {showPopup1 && (
                <div className="flex flex-col items-center justify-center">
                    <div className="relative w-full mx-auto rounded shadow-lg p-5 border border-red h-64">
                        <form className="w-full">
                            <div className="flex md:items-center mb-6">
                                <label className="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4">
                                    Player One
                                </label>
                                <div className="flex-grow">
                                    <input
                                        className="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                                        id="inline-password"
                                        type="password"
                                        placeholder="******************"
                                    />
                                </div>
                            </div>
                            <div className="flex md:items-center mb-6">
                                <label className="block text-gray-500 font-bold md:text-right mb-2 md:mb-0 pr-4">
                                    Player Two
                                </label>
                                <div className="flex-grow">
                                    <input
                                        className="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
                                        id="inline-password"
                                        type="password"
                                        placeholder="******************"
                                    />
                                </div>
                            </div>

                            <div className="flex justify-end">
                                <button
                                    className="shadow bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4 rounded"
                                    type="button"
                                >
                                    Play!
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}

            <button onClick={openPopupTwoAndCloseOthers}>
                <div className="bg-blue p-2 rounded-lg w-full h-12 flex items-center justify-center hover:bg-green transition-colors duration-200">
                    <h1 className="text-xl font-bold">Find&nbsp;Game</h1>
                </div>
            </button>

            {showPopup2 && (
                <div className="flex flex-col items-center justify-center">
                    <div className="relative w-full mx-auto rounded shadow-lg p-5 border border-red h-64">
                        <form onSubmit={handleSubmitFindGame}></form>
                    </div>
                </div>
            )}

            <button onClick={openPopupThreeAndCloseOthers}>
                <div className="bg-blue p-2 rounded-lg w-full h-12 flex items-center justify-center hover:bg-green transition-colors duration-200">
                    <h1 className="text-xl font-bold">Mint&nbsp;Game</h1>
                </div>
            </button>

            {showPopup3 && (
                <div className="flex flex-col items-center justify-center">
                    <div className="relative w-full mx-auto rounded shadow-lg p-5 border border-red h-64">
                        <form onSubmit={handleSubmitMintGame}></form>
                    </div>
                </div>
            )}
        </div>
    );
};

export default GameOptions;
