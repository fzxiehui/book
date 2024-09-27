const { description } = require('../../package')

module.exports = {
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#title
   */
  title: '葵花宝典',
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#description
   */
  description: description,

  /**
   * Extra tags to be injected to the page HTML `<head>`
   *
   * ref：https://v1.vuepress.vuejs.org/config/#head
   */
  head: [
    ['meta', { name: 'theme-color', content: '#3eaf7c' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }]
  ],

  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   *
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  themeConfig: {
    repo: '',
    editLinks: false,
    docsDir: 'src',
    editLinkText: 'edit',
    lastUpdated: true,
    nav: [
      {
        text: 'Docs',
        link: '/guide/'
      },
      {
        text: 'Github',
        link: 'https://github.com/fzxiehui/book'
      },
    ],
    sidebar: [
      {
        title: '指引',
        collapsable: false,
        path: '/guide/',
        children: [
        ]
      },
      {
        title: 'Linux',
        collapsable: false,
        path: '/linux/',
        children: [
          '/linux/device.md',
        ]
      },
      {
        title: '运维',
        collapsable: false,
        path: '/ops/',
        children: [
          '/ops/network.md',
          '/ops/systemctl.md',
          '/ops/iptables.md',
          '/ops/disk.md',
          '/ops/nginx.md',
          '/ops/docker.md',
          '/ops/docker_server.md',
          '/ops/apt.md',
        ]
      },
      {
        title: '电路设计',
        collapsable: false,
        path: '/ad/',
        children: [
          '/ad/basis.md',
        ]
      },
      {
        title: '个性化设置',
        collapsable: false,
        path: '/habit/',
        children: [
          '/habit/ubuntu.md',
          '/habit/vim.md',
        ]
      },
      {
        title: 'Golang',
        collapsable: false,
        path: '/golang/',
        children: [
          '/golang/install.md',
          '/golang/build.md',
          '/golang/websocket.md',
          '/golang/decimal.md',
          '/golang/log.md',
        ]
      },
      {
        title: 'Go自编写软件包',
        collapsable: false,
        path: '/gopkg/',
        children: [
          '/gopkg/uart.md',
        ]
      },
      {
        title: 'Python',
        collapsable: false,
        path: '/python/',
        children: [
          '/python/venv.md',
          '/python/net.md',
          '/python/pack.md',
        ]
      },
      {
        title: 'OpenCV',
        collapsable: false,
        path: '/opencv/',
        children: [
          '/opencv/quick_start.md',
          '/opencv/match_multiple.md',
        ]
      },
      {
        title: '奇技淫巧',
        collapsable: false,
        path: '/acrobatics/',
        children: [
          '/acrobatics/linux.md',
          '/acrobatics/windows.md',
          '/acrobatics/npm.md',
        ]
      },
      {
        title: '经典文学',
        collapsable: false,
        path: '/classics/',
        children: [
          '/classics/TaoTeChing.md',
        ]
      },
    ]
    // sidebar: {
    //   '/guide/': [
    //     {
    //       title: 'Guide',
    //       collapsable: false,
    //       children: [
    //         '',
    //         'using-vue',
    //       ]
    //     }
    //   ]
    // }
  },

  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    '@vuepress/plugin-back-to-top',
    '@vuepress/plugin-medium-zoom',
  ]
}
