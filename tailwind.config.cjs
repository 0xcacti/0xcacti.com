module.exports = {
    mode: "jit",
    purge: ["./pages/**/*.{js,ts,jsx,tsx}", "./src/**/*.{js,ts,jsx,tsx}"],
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {
            colors: {
                green: "#B5CCBA",
                red: "#E74F5E",
                blue: "#2DACB4",
                yellow: "#F5E617",
                white: "#F7F1DC",
                black: "#3B3D3C",
            },
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
};
