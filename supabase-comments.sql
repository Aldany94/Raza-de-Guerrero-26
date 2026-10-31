create table if not exists public.private_comments (
    id uuid primary key default gen_random_uuid(),
    question_category text not null check (char_length(question_category) between 1 and 80),
    question_title text not null check (char_length(question_title) between 1 and 500),
    full_name text not null check (char_length(btrim(full_name)) between 2 and 120),
    comment_text text check (comment_text is null or char_length(comment_text) <= 3000),
    audio_path text check (audio_path is null or char_length(audio_path) <= 255),
    created_at timestamptz not null default now(),
    check (
        char_length(btrim(coalesce(comment_text, ''))) > 0
        or audio_path is not null
    )
);

alter table public.private_comments enable row level security;
revoke all on public.private_comments from public, anon, authenticated;
grant insert on public.private_comments to anon;

drop policy if exists "Anonymous can submit private comments" on public.private_comments;
create policy "Anonymous can submit private comments"
    on public.private_comments
    for insert
    to anon
    with check (true);

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
    'private-comments',
    'private-comments',
    false,
    10485760,
    array['audio/webm', 'audio/ogg', 'audio/mp4']
)
on conflict (id) do update
set public = false,
    file_size_limit = excluded.file_size_limit,
    allowed_mime_types = excluded.allowed_mime_types;

drop policy if exists "Anonymous can upload private comment audio" on storage.objects;
create policy "Anonymous can upload private comment audio"
    on storage.objects
    for insert
    to anon
    with check (bucket_id = 'private-comments');
