import { defineConfig } from 'umi';

export default defineConfig({
  nodeModulesTransform: {
    type: 'none',
  },
  history: {
    type: 'hash'
  },
  routes: [
    { path: '/', redirect: '/login', exact: true },
    { path: '/login', component: '@/pages/login', exact: true },
    {
      path: '/',
      component: '@/layouts/index',
      routes: [
        { path: '/myHome', component: '@/pages/myHome', exact: true },
        { path: '/musicLibrary', component: '@/pages/musicLibrary', exact: true },
        { path: '/videoLibrary', component: '@/pages/videoLibrary', exact: true },
        { path: '/myFavorite', component: '@/pages/myFavorite', exact: true },
        { path: '/managerMedia', component: '@/pages/managerMedia', exact: true },
      ]
    },
  ],
});
