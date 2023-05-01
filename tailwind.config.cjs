module.exports = {
    mode: "jit",
    purge: ["./pages/**/*.{js,ts,jsx,tsx}", "./src/**/*.{js,ts,jsx,tsx}"],
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {
            colors: {
                "soft-green": "#DDF7E3",
                "mid-green": "#C7E8CA",
                "dark-green": "#5D9C59",
                red: "#DF2E38",
                yellow: "#F5E617",
                "off-white": "#FDF5E6",
            },
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
};
