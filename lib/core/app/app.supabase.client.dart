// initializes globally supabase client
// called fromm app main
// creds are hardcoded to ease reproduction later

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initializeSupabase() async {
  await Supabase.initialize(
    url: "https://rzpzgvfodgxxdfgipqhh.supabase.co", // not advisable to store creds in source code -
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6cHpndmZvZGd4eGRmZ2lwcWhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUxNzk0NDcsImV4cCI6MjA0MDc1NTQ0N30.GSkzwLEDfqCIMLUTJ52zLAWOk-a--1_5j321-6WngnU",
  );
}
