const path = require('path');
const CleanWebpackPlugin = require('clean-webpack-plugin')

module.exports = {
  entry: './frontend/src/signum.js',
  output: {
    path: __dirname + '/frontend/dist',
    filename: 'signum.js',
    library: 'Signum',
    libraryTarget: 'umd'
  },
  plugins: [

  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['env'],
            plugins: ["transform-class-properties"]
          }
        }
      },
      {
        test: /\.(|ttf|eot|svg|woff2?)(\?[\s\S]+)?$/,
        use: 'file-loader',
      },
    ]
  },
  resolve: {
    modules: [path.resolve('./node_modules'), path.resolve('./src')],
    extensions: ['.json', '.js']
  }
}



// const MiniCssExtractPlugin = require("mini-css-extract-plugin");
// const path = require('path');

// const devMode = process.env.NODE_ENV !== 'production'

// module.exports = {
//   mode: devMode ? "development" : "production",
//   entry: {
//     signum: ['./frontend/src/signum.js']
//   },
//   output: {
//     path: __dirname + '/frontend/dist',
//     filename: '[name].js',
//   },

//   module: {
//     rules: [
//       {
//         test: /\.(c|sa|sc)ss$/,
//         exclude: /(node_modules)/,
//         // Use the following loaders from right-to-left, so it will
//         // use sass-loader first and ending with MiniCssExtractPlugin
//         use: [
//           {
//             // Extracts the CSS into a separate file and uses the
//             // defined configurations in the 'plugins' section
//             loader: MiniCssExtractPlugin.loader
//           },
//           {
//             // Interprets CSS
//             loader: "css-loader",
//             options: {
//               importLoaders: 2
//             }
//           },
//           {
//             // Adds support for Sass files, if using Less, then
//             // use the less-loader
//             loader: "sass-loader"
//           }
//         ]
//       },
//       {
//         test: /\.js$/,
//         exclude: /(node_moduldes)/,
//         use: {
//           loader: 'babel-loader',
//           options: {
//             presets: ['@babel/preset-env']
//           }
//         }
//       },
//       {
//         test: /\.(ttf|eot|svg|woff2?)(\?[\s\S]+)?$/,
//         use: 'file-loader',
//       },
//     ]
//   },
//   plugins: [
//     // Configuration options for MiniCssExtractPlugin. Here I'm only
//     // indicating what the CSS output file name should be and
//     // the location
//     new MiniCssExtractPlugin({
//       filename: devMode ? "[name].css" : "[name].min.css"
//     })
//   ],
//   resolve: {
//     modules: [path.resolve('./node_modules'), path.resolve('./src')],
//     extensions: ['.json', '.js']
//   }
// }
