-- Renomeia label da foto de capa
update public.page_content
  set label = 'Foto de capa (header)'
  where section = 'hero' and key = 'image_url';

-- Remove campos de links/cards que não fazem mais sentido (imobiliária)
delete from public.page_content
  where (section = 'links' and key in ('whatsapp_number', 'youtube_url', 'email'))
     or (section = 'cards' and key in ('img_whatsapp', 'img_imoveis', 'img_comprar', 'img_vender', 'img_youtube'));

-- Atualiza label do Instagram existente
update public.page_content
  set label = 'Me siga no Instagram'
  where section = 'links' and key = 'instagram_url';

update public.page_content
  set label = 'Foto card — Instagram'
  where section = 'cards' and key = 'img_instagram';

-- Novos campos de links (osteopatia)
insert into public.page_content (section, key, value, type, label) values
  ('links', 'booking_foz_url',        '', 'url', 'Agende sua consulta em Foz do Iguaçu'),
  ('links', 'booking_santa_rita_url', '', 'url', 'Agende sua consulta em Santa Rita (Py)'),
  ('links', 'tiktok_url',             '', 'url', 'Me siga no Tiktok'),
  ('links', 'google_review_url',      '', 'url', 'Avalie nosso atendimento no Google')
on conflict (section, key) do nothing;

-- Novos campos de fotos dos cards
insert into public.page_content (section, key, value, type, label) values
  ('cards', 'img_foz',         '', 'image', 'Foto card — Foz do Iguaçu'),
  ('cards', 'img_santa_rita',  '', 'image', 'Foto card — Santa Rita (Py)'),
  ('cards', 'img_tiktok',      '', 'image', 'Foto card — Tiktok'),
  ('cards', 'img_google',      '', 'image', 'Foto card — Avaliação Google')
on conflict (section, key) do nothing;
