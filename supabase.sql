create table public.progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.progress enable row level security;
create policy "read own" on public.progress for select using ((select auth.uid()) = user_id);
create policy "insert own" on public.progress for insert with check ((select auth.uid()) = user_id);
create policy "update own" on public.progress for update using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "delete own" on public.progress for delete using ((select auth.uid()) = user_id);

-- ===== Added: size cap and account deletion (run these in the Supabase SQL editor) =====
alter table public.progress add constraint progress_size_cap check (octet_length(data::text) <= 1000000);

create or replace function public.delete_my_account()
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
  if auth.uid() is null then
    raise exception 'not signed in';
  end if;
  delete from auth.users where id = auth.uid();   -- progress row is removed automatically (on delete cascade)
end;
$$;
revoke all on function public.delete_my_account() from public, anon;
grant execute on function public.delete_my_account() to authenticated;
