import { BigNumber } from "@ethersproject/bignumber";
import styles from "../styles/TicTacToe.module.css";
import { useContractRead } from "wagmi";
import { erc721ABI } from "wagmi";
import contractConfig from "../contracts/TicTacToe.json";

interface DisplayDataProps {
    refreshData: () => void;
    tokenID: number;
}

const TicTacToeBoard: React.FC<DisplayDataProps> = ({ tokenID }) => {
    const { data, isError, isLoading } = useContractRead({
        address: contractConfig.address as `0x${string}`,
        abi: contractConfig.abi,
        functionName: "retrieveAllGameInfo",
        args: [BigNumber.from(tokenID)],
    });

    // if (isLoading) return <div>Loading...</div>;
    if (isError) return <div>Error {isError}</div>;

    return (
        <div className={styles.boardContainer}>
            <div className={styles.crossVerticalLeft}></div>
            <div className={styles.crossVerticalRight}></div>
            <div className={styles.crossHorizontalTop}></div>
            <div className={styles.crossHorizontalBottom}></div>
        </div>
    );
};
export default TicTacToeBoard;
