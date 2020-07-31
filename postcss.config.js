module.exports = {
    plugins: [
        require("tailwindcss"),
        require("autoprefixer"),
        require("postcss-import"),
        require("postcss-flexbugs-fixes"),
        require("postcss-preset-env")({
            autoprefixer: {
                flexbox: "no-2009",
            },
            stage: 3,
        }),
    ],
};
