import { BigNumber } from "@ethersproject/bignumber";
import styles from "../styles/TicTacToe.module.css";
import { useContractRead } from "wagmi";
import { erc721ABI } from "wagmi";
import contractConfig from "../contracts/TicTacToe.json";

interface DisplayDataProps {
    refreshData: () => void;
    tokenID: number;
}

const TicTacToeBoard: React.FC<DisplayDataProps> = () => {
    // const { data, isError, isLoading } = useContractRead({
    //     address: contractConfig.address as `0x${string}`,
    //     abi: contractConfig.abi,
    //     functionName: "retrieveAllGameInfo",
    //     args: [BigNumber.from(0)],
    // });

    // // if (isLoading) return <div>Loading...</div>;
    // if (isError) return <div>Error {isError}</div>;

    return (
        <div className={styles.boardContainer}>
            <div className={styles.crossVerticalLeft}></div>
            <div className={styles.crossVerticalRight}></div>
            <div className={styles.crossHorizontalTop}></div>
            <div className={styles.crossHorizontalBottom}></div>
            <button>
                <div className={styles.box00}></div>
            </button>
            <button>
                <div className={styles.box01}></div>
            </button>
            <button>
                <div className={styles.box02}></div>
            </button>
            <button>
                <div className={styles.box10}></div>
            </button>
            <button>
                <div className={styles.box11}></div>
            </button>
            <button>
                <div className={styles.box12}></div>
            </button>
            <button>
                <div className={styles.box20}></div>
            </button>
            <button>
                <div className={styles.box21}></div>
            </button>
            <button>
                <div className={styles.box22}></div>
            </button>
        </div>
    );
};
export default TicTacToeBoard;
