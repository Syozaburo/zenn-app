<template>
  <v-app dark>

  <div>
    <Loading />
  </div>

  <v-navigation-drawer v-model="drawer" :mini-variant="miniVariant" :clipped="clipped" fixed app>
    <v-list>
      <v-list-item v-for="(item, i) in items" :key="i" :to="item.to" router exact>
        <v-list-item-action>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-item-action>
        <v-list-item-content>
          <v-list-item-title v-text="item.title" />
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
  <v-app-bar :clipped-left="clipped" fixed app>
    <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
    <v-btn icon @click.stop="miniVariant = !miniVariant">
      <v-icon>mdi-{{ `chevron-${miniVariant ? 'right' : 'left'}` }}</v-icon>
    </v-btn>
     <v-btn icon @click.stop="clipped = !clipped">
       <v-icon>mdi-application</v-icon>
    </v-btn>
     <v-btn icon @click.stop="fixed = !fixed">
       <v-icon>mdi-minus</v-icon>
    </v-btn>
     <v-toolbar-title v-text="title" />
    <v-spacer />
    <v-btn icon @click.stop="rightDrawer = !rightDrawer">
      <v-icon>mdi-menu</v-icon>
    </v-btn>
  </v-app-bar>
  <v-content>
    <v-container>
      <nuxt />
    </v-container>
  </v-content>
  <v-navigation-drawer v-model="rightDrawer" :right="right" temporary fixed>
    <v-list>
      <v-list-item @click.native="right = !right">
        <v-list-item-action>
           <v-icon light>mdi-repeat</v-icon>
        </v-list-item-action>
        <v-list-item-title>Switch drawer (click me)</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
   <v-footer :fixed="fixed" app>
    <span>&copy; 2022</span>
  </v-footer>
  </v-app>
 </template>

<script>

 import Loading from "@/components/Loading"; 

  export default {
    data() {
      return {
        clipped: false,
        drawer: false,
        fixed: false,
        miniVariant: false,
        right: true,
        rightDrawer: false,
        title: 'TODO App'
      }
    },
     components: {
      Loading
    },
    computed: {
      user() {
        return this.$store.state.auth.currentUser;
      },
      items() {
        if (this.user) {
          return [{
              icon: "mdi-apps",
              title: "TODOS",
              to: "/"
            },
            {
              icon: "mdi-chart-bubble",
              title: "MYPAGE",
              to: "/mypage"
            }
          ];
        } else {
          return [{
              icon: "mdi-apps",
              title: "LOGIN",
              to: "/login"
            },
            {
              icon: "mdi-chart-bubble",
              title: "SIGNUP",
              to: "/signup"
            }
          ];
        }
      }
    }
  }
</script>

<style>
html {
  font-family: 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI',
    Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: border-box;
  margin: 0;
}

.button--green {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #3b8070;
  color: #3b8070;
  text-decoration: none;
  padding: 10px 30px;
}

.button--green:hover {
  color: #fff;
  background-color: #3b8070;
}

.button--grey {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #35495e;
  color: #35495e;
  text-decoration: none;
  padding: 10px 30px;
  margin-left: 15px;
}

.button--grey:hover {
  color: #fff;
  background-color: #35495e;
}
</style>
