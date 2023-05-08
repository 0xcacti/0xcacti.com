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
        <>
            <button onClick={openPopupOneAndCloseOthers}>
                <div className="bg-red p-2 rounded-lg w-full h-12 flex items-center justify-center hover:bg-green transition-colors duration-200">
                    <h1 className="text-xl font-bold">New&nbsp;Game</h1>
                </div>
            </button>

            {showPopup1 && (
                <div className="flex flex-col items-center justify-center">
                    <div className="bg-red w-full rounded-lg mx-auto rounded shadow-lg p-5">
                        <form onSubmit={handleSubmitNewGame}></form>
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
                    <div className="relative bg-red w-11/12 md:max-w-md mx-auto rounded shadow-lg p-5">
                        <form onSubmit={handleSubmitFindGame}></form>
                    </div>
                </div>
            )}

            <button onClick={openPopupThreeAndCloseOthers}>
                <div className="bg-red p-2 rounded-lg w-full h-12 flex items-center justify-center hover:bg-green transition-colors duration-200">
                    <h1 className="text-xl font-bold">Mint&nbsp;Game</h1>
                </div>
            </button>

            {showPopup3 && (
                <div className="flex flex-col items-center justify-center">
                    <div className="relative bg-red w-11/12 md:max-w-md mx-auto rounded shadow-lg p-5">
                        <form onSubmit={handleSubmitMintGame}></form>
                    </div>
                </div>
            )}
        </>
    );
};

export default GameOptions;
