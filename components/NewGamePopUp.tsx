// NewGamePopUp.tsx
import React, { useState } from "react";

const NewGamePopUp: React.FC = () => {
    const [isOpen, setIsOpen] = useState(false);

    const togglePopup = () => {
        setIsOpen(!isOpen);
    };

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        // Handle form submission here
    };

    return (
        <>
            <button
                onClick={togglePopup}
                className="bg-blue hover:bg-red text-white font-bold py-2 px-4 rounded"
            >
                Open Popup
            </button>

            {isOpen && (
                <div className="fixed inset-0 z-10 flex items-center justify-center">
                    <div className="absolute inset-0 bg-black opacity-75"></div>

                    <div className="relative bg-red w-11/12 md:max-w-md mx-auto rounded shadow-lg p-5">
                        <button
                            onClick={togglePopup}
                            className="absolute right-0 top-0 m-2 text-gray-500 hover:text-gray-800"
                        >
                            &times;
                        </button>
                        <form onSubmit={handleSubmit}>
                            <div className="mb-4">
                                <label
                                    className="block text-gray-700 text-sm font-bold mb-2"
                                    htmlFor="username"
                                >
                                    Username
                                </label>
                                <input
                                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                    id="username"
                                    type="text"
                                    placeholder="Username"
                                />
                            </div>
                            <div className="mb-6">
                                <label
                                    className="block text-gray-700 text-sm font-bold mb-2"
                                    htmlFor="password"
                                >
                                    Password
                                </label>
                                <input
                                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                                    id="password"
                                    type="password"
                                    placeholder="******************"
                                />
                            </div>
                            <div className="flex items-center justify-between">
                                <button
                                    className="bg-blue hover:bg-red text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                                    type="submit"
                                >
                                    Submit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            )}
        </>
    );
};

export default NewGamePopUp;
