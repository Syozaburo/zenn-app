<template>
  <v-card>
    <v-card-title>
      Todo List
      <v-spacer></v-spacer>
      <v-text-field v-model="search" label="Search" single-line hide-details></v-text-field>
    </v-card-title>
    <v-data-table :headers="headers" :items="todos" :search="search"></v-data-table>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      todos: [
        {
          title: "test",
          username: "太郎"
        }
      ],
      search: "",
      headers: [
        {
          text: "タイトル", //先頭のヘッダーの内容
          align: "left", //テーブルに対して文字を左詰め
          sortable: false,
          value: "title" //itemsのプロパティに含まれる値を表示
        },
        { text: "ユーザー名", 
          value: "username"
        }
      ]
    };
  }
};
</script>

<style>
</style>
