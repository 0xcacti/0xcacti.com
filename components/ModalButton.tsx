import React from "react";

interface ModalButtonProps {
    handleClick: () => void;
    children: React.ReactNode;
}

const ModalButton: React.FC<ModalButtonProps> = (props) => (
    <button className="bg-blue" onClick={props.handleClick}>
        {props.children}
    </button>
);

export default ModalButton;
