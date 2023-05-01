import Link from "next/link";
import { ConnectButton } from "@rainbow-me/rainbowkit";

export default function Projects() {
    return (
        <div className="mb-10 h-screen bg-off-white">
            <div className="container flex justify-between px-6 py-8 mx-auto">
                <Link href="/">
                    <a className="text-xl font-bold text-gray-800 md:text-2xl hover:text-red">
                        0xcacti
                    </a>
                </Link>
                <ConnectButton />
            </div>
            <div className="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
                <div className="mt-6 grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
                    <div className="group relative">
                        <div className="min-h-80 aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-md bg-gray-200 lg:aspect-none group-hover:opacity-75 lg:h-80"></div>
                        <div className="mt-4 flex justify-between">
                            <div>
                                <h3 className="text-sm text-gray-700">
                                    <a href="#">
                                        <span
                                            aria-hidden="true"
                                            className="absolute inset-0"
                                        ></span>
                                        Basic Tee
                                    </a>
                                </h3>
                                <p className="mt-1 text-sm text-gray-500">
                                    Black
                                </p>
                            </div>
                            <p className="text-sm font-medium text-gray-900">
                                $35
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
