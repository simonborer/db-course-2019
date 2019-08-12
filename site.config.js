const weeks = require('./src/data/weeks');

module.exports = {
  site: {
    title: 'Intro to Databases',
    description: 'Posts and slides',
    basePath: process.env.NODE_ENV === 'production' ? '' : '/docs',
    weeks
  },
  build: {
    outputPath: process.env.NODE_ENV === 'production' ? './docs' : './docs'
  }
};
