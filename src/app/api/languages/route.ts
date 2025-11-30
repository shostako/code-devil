import { NextResponse } from "next/server";
import { getLanguages } from "@/lib/supabase/queries";

export async function GET() {
  const languages = await getLanguages();
  return NextResponse.json(languages);
}
