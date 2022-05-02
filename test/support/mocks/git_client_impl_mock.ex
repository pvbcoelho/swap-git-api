defmodule SwapGitApi.Test.Mocks.GitClientImplMock do
  @moduledoc """
  This module is responsable for determinate Client HTTP to Git API
  """
  @behaviour SwapGitApi.Infrastructure.HttpClient.GitClient
  def get_issues("teste_user", "teste_repo", 1, 100) do
    {:ok,
     [
       %{
         "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/7541",
         "repository_url" => "https://api.github.com/repos/elixir-lang/elixir",
         "labels_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/7541/labels%{/name}",
         "comments_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/7541/comments",
         "events_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/7541/events",
         "html_url" => "https://github.com/elixir-lang/elixir/issues/7541",
         "id" => 312_483_494,
         "node_id" => "MDU6SXNzdWUzMTI0ODM0OTQ=",
         "number" => 7541,
         "title" => "Parametrized remote types for protocols",
         "user" => %{
           "login" => "paulperegud",
           "id" => 247_162,
           "node_id" => "MDQ6VXNlcjI0NzE2Mg==",
           "avatar_url" => "https://avatars.githubusercontent.com/u/247162?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/paulperegud",
           "html_url" => "https://github.com/paulperegud",
           "followers_url" => "https://api.github.com/users/paulperegud/followers",
           "following_url" => "https://api.github.com/users/paulperegud/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/paulperegud/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/paulperegud/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/paulperegud/subscriptions",
           "organizations_url" => "https://api.github.com/users/paulperegud/orgs",
           "repos_url" => "https://api.github.com/users/paulperegud/repos",
           "events_url" => "https://api.github.com/users/paulperegud/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/paulperegud/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "labels" => [
           %{
             "id" => 207_975,
             "node_id" => "MDU6TGFiZWwyMDc5NzU=",
             "url" => "https://api.github.com/repos/elixir-lang/elixir/labels/Kind:Feature",
             "name" => "Kind:Feature",
             "color" => "0052cc",
             "default" => false,
             "description" => nil
           },
           %{
             "id" => 778_790,
             "node_id" => "MDU6TGFiZWw3Nzg3OTA=",
             "url" => "https://api.github.com/repos/elixir-lang/elixir/labels/Note:Discussion",
             "name" => "Note:Discussion",
             "color" => "bfdadc",
             "default" => false,
             "description" => nil
           },
           %{
             "id" => 17_739_153,
             "node_id" => "MDU6TGFiZWwxNzczOTE1Mw==",
             "url" => "https://api.github.com/repos/elixir-lang/elixir/labels/App:Elixir",
             "name" => "App:Elixir",
             "color" => "CCCCCC",
             "default" => false,
             "description" => nil
           },
           %{
             "id" => 39_802_986,
             "node_id" => "MDU6TGFiZWwzOTgwMjk4Ng==",
             "url" => "https://api.github.com/repos/elixir-lang/elixir/labels/Level:Advanced",
             "name" => "Level:Advanced",
             "color" => "f7c6c7",
             "default" => false,
             "description" => nil
           }
         ],
         "state" => "open",
         "locked" => false,
         "assignee" => nil,
         "assignees" => [],
         "milestone" => nil,
         "comments" => 14,
         "created_at" => "2018-04-09T10:51:55Z",
         "updated_at" => "2021-10-12T10:59:41Z",
         "closed_at" => nil,
         "author_association" => "NONE",
         "active_lock_reason" => nil,
         "body" =>
           "Being able to parametrize types (`[pos_integer()]`) is a critical feature of dialyzer. Support for parametrization is extended to some of remote types (`:queue.queue(pos_integer())`) but unfortunately not to all of them. \r\n\r\nOne I miss it the most ability to parametrize Enum (`Enum.t(pos_integer())`).",
         "reactions" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/7541/reactions",
           "total_count" => 4,
           "+1" => 0,
           "-1" => 0,
           "laugh" => 0,
           "hooray" => 0,
           "confused" => 0,
           "heart" => 4,
           "rocket" => 0,
           "eyes" => 0
         },
         "timeline_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/7541/timeline",
         "performed_via_github_app" => nil
       }
     ]}
  end

  def get_issues("teste_user", "teste_repo", 2, _per_page), do: {:ok, []}

  def get_issues("teste_user_processable_error", _repo, _page, _per_page),
    do: {:error, :processable_error}

  def get_issues("teste_user_error", _repo, _page, _per_page),
    do: {:error, :error}

  def get_issues("teste_user_not_found", _repo, _page, _per_page),
    do: {:error, :not_found}

  def get_commits("teste_user_processable_error", _repo, _page, _per_page),
    do: {:error, :processable_error}

  def get_commits("teste_user_error", _repo, _page, _per_page),
    do: {:error, :error}

  def get_commits("teste_user_not_found", _repo, _page, _per_page),
    do: {:error, :not_found}

  def get_commits("teste_user", "teste_repo", 2, _per_page), do: {:ok, []}

  def get_commits("teste_user", "teste_repo", 1, 100) do
    {:ok,
     [
       %{
         "sha" => "1907914cf0d9d25b32373d3c8ad6b4b59877baaf",
         "node_id" => "C_kwDOABLXGtoAKDE5MDc5MTRjZjBkOWQyNWIzMjM3M2QzYzhhZDZiNGI1OTg3N2JhYWY",
         "commit" => %{
           "author" => %{
             "name" => "José Valim",
             "email" => "jose.valim@dashbit.co",
             "date" => "2022-05-02T10:08:05Z"
           },
           "committer" => %{
             "name" => "GitHub",
             "email" => "noreply@github.com",
             "date" => "2022-05-02T10:08:05Z"
           },
           "message" =>
             "Store :mfa in the Task struct (#11794)\n\nThis field can be used for reflection purposes.\r\n\r\nCloses #11716.\r\nCloses #11720.",
           "tree" => %{
             "sha" => "0132c9467acdbf655ed125d8679eb04847cd59f3",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/git/trees/0132c9467acdbf655ed125d8679eb04847cd59f3"
           },
           "url" =>
             "https://api.github.com/repos/elixir-lang/elixir/git/commits/1907914cf0d9d25b32373d3c8ad6b4b59877baaf",
           "comment_count" => 0,
           "verification" => %{
             "verified" => true,
             "reason" => "valid",
             "signature" =>
               "-----BEGIN PGP SIGNATURE-----\n\nwsBcBAABCAAQBQJib62FCRBK7hj4Ov3rIwAAatMIAJ8M716hFtoamhmzuHnwK0z1\nzRhZJK1ek/Dl6Hz4xZenl8PBoTZWYuJqV7uVIrWegsVMHax+tD3j/hjTSz0rAwsV\ndZyj+VhToWOLy21DRhj0IiRPypoTiveh+YfKKS+fmmZTvAMbiA8Lxet+Z9YzCD5C\n3Omrubo865JXUZSl3Jl4F7WYP8vTI0TTmy7KdinLaYLfUPSaX3qMqqRHorf4I3Xw\nAZw6PTOGEVJ93P6vEPfV/Wh5PF+8aIw1EqTwVtwHwVKnt6YXxNjI3wRuxcTz34aS\n38850/iMdjXLeCjjA6u03W322L32/9KOzvSpGy4m2uLZafsCVn1rkFOplrvLORU=\n=RK4q\n-----END PGP SIGNATURE-----\n",
             "payload" =>
               "tree 0132c9467acdbf655ed125d8679eb04847cd59f3\nparent 277184535e9d48c17b4b3bceaa5bfbe2175337f2\nauthor José Valim <jose.valim@dashbit.co> 1651486085 +0200\ncommitter GitHub <noreply@github.com> 1651486085 +0200\n\nStore :mfa in the Task struct (#11794)\n\nThis field can be used for reflection purposes.\r\n\r\nCloses #11716.\r\nCloses #11720.\r\n"
           }
         },
         "url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/1907914cf0d9d25b32373d3c8ad6b4b59877baaf",
         "html_url" =>
           "https://github.com/elixir-lang/elixir/commit/1907914cf0d9d25b32373d3c8ad6b4b59877baaf",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/1907914cf0d9d25b32373d3c8ad6b4b59877baaf/comments",
         "author" => %{
           "login" => "josevalim",
           "id" => 9582,
           "node_id" => "MDQ6VXNlcjk1ODI=",
           "avatar_url" => "https://avatars.githubusercontent.com/u/9582?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/josevalim",
           "html_url" => "https://github.com/josevalim",
           "followers_url" => "https://api.github.com/users/josevalim/followers",
           "following_url" => "https://api.github.com/users/josevalim/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/josevalim/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/josevalim/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/josevalim/subscriptions",
           "organizations_url" => "https://api.github.com/users/josevalim/orgs",
           "repos_url" => "https://api.github.com/users/josevalim/repos",
           "events_url" => "https://api.github.com/users/josevalim/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/josevalim/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "committer" => %{
           "login" => "web-flow",
           "id" => 19_864_447,
           "node_id" => "MDQ6VXNlcjE5ODY0NDQ3",
           "avatar_url" => "https://avatars.githubusercontent.com/u/19864447?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/web-flow",
           "html_url" => "https://github.com/web-flow",
           "followers_url" => "https://api.github.com/users/web-flow/followers",
           "following_url" => "https://api.github.com/users/web-flow/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/web-flow/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/web-flow/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/web-flow/subscriptions",
           "organizations_url" => "https://api.github.com/users/web-flow/orgs",
           "repos_url" => "https://api.github.com/users/web-flow/repos",
           "events_url" => "https://api.github.com/users/web-flow/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/web-flow/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "parents" => [
           %{
             "sha" => "277184535e9d48c17b4b3bceaa5bfbe2175337f2",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/commits/277184535e9d48c17b4b3bceaa5bfbe2175337f2",
             "html_url" =>
               "https://github.com/elixir-lang/elixir/commit/277184535e9d48c17b4b3bceaa5bfbe2175337f2"
           }
         ]
       },
       %{
         "sha" => "277184535e9d48c17b4b3bceaa5bfbe2175337f2",
         "node_id" => "C_kwDOABLXGtoAKDI3NzE4NDUzNWU5ZDQ4YzE3YjRiM2JjZWFhNWJmYmUyMTc1MzM3ZjI",
         "commit" => %{
           "author" => %{
             "name" => "José Valim",
             "email" => "jose.valim@dashbit.co",
             "date" => "2022-05-02T09:29:32Z"
           },
           "committer" => %{
             "name" => "José Valim",
             "email" => "jose.valim@dashbit.co",
             "date" => "2022-05-02T09:29:54Z"
           },
           "message" =>
             "Support :test_elixirc_options in mix test\n\nAnd skip debug and docs chunks by default.\n\nCloses #11755.",
           "tree" => %{
             "sha" => "2c4825fe23c0cd6d65f97ccb6b8e7340c2fed8e5",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/git/trees/2c4825fe23c0cd6d65f97ccb6b8e7340c2fed8e5"
           },
           "url" =>
             "https://api.github.com/repos/elixir-lang/elixir/git/commits/277184535e9d48c17b4b3bceaa5bfbe2175337f2",
           "comment_count" => 0,
           "verification" => %{
             "verified" => false,
             "reason" => "unsigned",
             "signature" => nil,
             "payload" => nil
           }
         },
         "url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/277184535e9d48c17b4b3bceaa5bfbe2175337f2",
         "html_url" =>
           "https://github.com/elixir-lang/elixir/commit/277184535e9d48c17b4b3bceaa5bfbe2175337f2",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/277184535e9d48c17b4b3bceaa5bfbe2175337f2/comments",
         "author" => %{
           "login" => "josevalim",
           "id" => 9582,
           "node_id" => "MDQ6VXNlcjk1ODI=",
           "avatar_url" => "https://avatars.githubusercontent.com/u/9582?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/josevalim",
           "html_url" => "https://github.com/josevalim",
           "followers_url" => "https://api.github.com/users/josevalim/followers",
           "following_url" => "https://api.github.com/users/josevalim/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/josevalim/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/josevalim/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/josevalim/subscriptions",
           "organizations_url" => "https://api.github.com/users/josevalim/orgs",
           "repos_url" => "https://api.github.com/users/josevalim/repos",
           "events_url" => "https://api.github.com/users/josevalim/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/josevalim/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "committer" => %{
           "login" => "josevalim",
           "id" => 9582,
           "node_id" => "MDQ6VXNlcjk1ODI=",
           "avatar_url" => "https://avatars.githubusercontent.com/u/9582?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/josevalim",
           "html_url" => "https://github.com/josevalim",
           "followers_url" => "https://api.github.com/users/josevalim/followers",
           "following_url" => "https://api.github.com/users/josevalim/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/josevalim/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/josevalim/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/josevalim/subscriptions",
           "organizations_url" => "https://api.github.com/users/josevalim/orgs",
           "repos_url" => "https://api.github.com/users/josevalim/repos",
           "events_url" => "https://api.github.com/users/josevalim/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/josevalim/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "parents" => [
           %{
             "sha" => "fd51354d2c178428e9c780fc45c77b92f3ab377e",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/commits/fd51354d2c178428e9c780fc45c77b92f3ab377e",
             "html_url" =>
               "https://github.com/elixir-lang/elixir/commit/fd51354d2c178428e9c780fc45c77b92f3ab377e"
           }
         ]
       },
       %{
         "sha" => "fd51354d2c178428e9c780fc45c77b92f3ab377e",
         "node_id" => "C_kwDOABLXGtoAKGZkNTEzNTRkMmMxNzg0MjhlOWM3ODBmYzQ1Yzc3YjkyZjNhYjM3N2U",
         "commit" => %{
           "author" => %{
             "name" => "Artem Solomatin",
             "email" => "artem00298@gmail.com",
             "date" => "2022-05-02T08:52:37Z"
           },
           "committer" => %{
             "name" => "GitHub",
             "email" => "noreply@github.com",
             "date" => "2022-05-02T08:52:37Z"
           },
           "message" => "Fix punctuation and grammar issues in guides (#11790)",
           "tree" => %{
             "sha" => "4e4498f67e0fda8d10a8198da76bcd3d1e358e5b",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/git/trees/4e4498f67e0fda8d10a8198da76bcd3d1e358e5b"
           },
           "url" =>
             "https://api.github.com/repos/elixir-lang/elixir/git/commits/fd51354d2c178428e9c780fc45c77b92f3ab377e",
           "comment_count" => 0,
           "verification" => %{
             "verified" => true,
             "reason" => "valid",
             "signature" =>
               "-----BEGIN PGP SIGNATURE-----\n\nwsBcBAABCAAQBQJib5vVCRBK7hj4Ov3rIwAA764IACtPbkxgewCqD7ZQ5qvSTn/4\namMIX7JqjLEtbSByWL5LRKPSfMndgBioUqM1U8Hi81RNvHmYmqIb6XTqqoDKBYA6\nklaBVqc366VDDiqzkSR0BuvkrwiFP9U19tDYkSMkYT3IcohRmH2EYQoQjIEKAGeH\nGRMNeznmo8bJproZiIDX7TZkomJtFhDSmJJICgAoDBwTM516MZ3ZY5rX7/Q3ipV3\nvYfLtFgKemQHd02IpBDslNaMSkXmiwy2nVpieUZvqLfpomLHeUVgWYv2M6y7fp7T\nodHo0y1A+vujagaWMgkUEvKduk4vikQKAauNGgc9VKrn9k+5OUq1hxosxokX2b8=\n=INnh\n-----END PGP SIGNATURE-----\n",
             "payload" =>
               "tree 4e4498f67e0fda8d10a8198da76bcd3d1e358e5b\nparent 2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1\nauthor Artem Solomatin <artem00298@gmail.com> 1651481557 +0300\ncommitter GitHub <noreply@github.com> 1651481557 +0200\n\nFix punctuation and grammar issues in guides (#11790)\n\n"
           }
         },
         "url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/fd51354d2c178428e9c780fc45c77b92f3ab377e",
         "html_url" =>
           "https://github.com/elixir-lang/elixir/commit/fd51354d2c178428e9c780fc45c77b92f3ab377e",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/fd51354d2c178428e9c780fc45c77b92f3ab377e/comments",
         "author" => %{
           "login" => "solar05",
           "id" => 38_437_931,
           "node_id" => "MDQ6VXNlcjM4NDM3OTMx",
           "avatar_url" => "https://avatars.githubusercontent.com/u/38437931?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/solar05",
           "html_url" => "https://github.com/solar05",
           "followers_url" => "https://api.github.com/users/solar05/followers",
           "following_url" => "https://api.github.com/users/solar05/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/solar05/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/solar05/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/solar05/subscriptions",
           "organizations_url" => "https://api.github.com/users/solar05/orgs",
           "repos_url" => "https://api.github.com/users/solar05/repos",
           "events_url" => "https://api.github.com/users/solar05/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/solar05/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "committer" => %{
           "login" => "web-flow",
           "id" => 19_864_447,
           "node_id" => "MDQ6VXNlcjE5ODY0NDQ3",
           "avatar_url" => "https://avatars.githubusercontent.com/u/19864447?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/web-flow",
           "html_url" => "https://github.com/web-flow",
           "followers_url" => "https://api.github.com/users/web-flow/followers",
           "following_url" => "https://api.github.com/users/web-flow/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/web-flow/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/web-flow/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/web-flow/subscriptions",
           "organizations_url" => "https://api.github.com/users/web-flow/orgs",
           "repos_url" => "https://api.github.com/users/web-flow/repos",
           "events_url" => "https://api.github.com/users/web-flow/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/web-flow/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "parents" => [
           %{
             "sha" => "2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/commits/2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1",
             "html_url" =>
               "https://github.com/elixir-lang/elixir/commit/2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1"
           }
         ]
       },
       %{
         "sha" => "2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1",
         "node_id" => "C_kwDOABLXGtoAKDJjNzBiZDRmYTA1M2ZmZWYxYmJkYjhhNjY0YjViZGY5ODZjYjI1ZjE",
         "commit" => %{
           "author" => %{
             "name" => "Eksperimental",
             "email" => "eksperimental@autistici.org",
             "date" => "2022-05-02T06:42:09Z"
           },
           "committer" => %{
             "name" => "GitHub",
             "email" => "noreply@github.com",
             "date" => "2022-05-02T06:42:09Z"
           },
           "message" => "Update Copyright owners to manpages. (#11792)",
           "tree" => %{
             "sha" => "01421fc0098305603166a1f58adb5e368cda8c17",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/git/trees/01421fc0098305603166a1f58adb5e368cda8c17"
           },
           "url" =>
             "https://api.github.com/repos/elixir-lang/elixir/git/commits/2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1",
           "comment_count" => 0,
           "verification" => %{
             "verified" => true,
             "reason" => "valid",
             "signature" =>
               "-----BEGIN PGP SIGNATURE-----\n\nwsBcBAABCAAQBQJib31BCRBK7hj4Ov3rIwAAcG0IAJN79YsLfhf5YVif1Xg54Kp3\nFFTGgJVxs3nE6vqm7uH8xJZye21cUyyION/F/8ShKIGmDvjF9Ehvfp+Jfto40SN2\nbKiq+BSG9wN8h7nPGRAzeNWPJfWPibS9FfIfQFRqQ1JI2C3T4/kZn0cOreKyX90z\nSru8iVC/6l5H66/ykzAT9e5/TALlN0XcmqUMUtcIqM4MM4jc/IiBKMUc4Jwg3v2u\n+GRZNDK4jWmJtxn8Fprfcj377+ATY4T7Aurzjhpyf6T3RWNzz9cKGOq20fjKMcyE\nCckaO0DmP5A3maq+irOhXirtv2BCcoK53uNrMeotUdkXLFMAth4JSaLMGumaXVE=\n=NkLm\n-----END PGP SIGNATURE-----\n",
             "payload" =>
               "tree 01421fc0098305603166a1f58adb5e368cda8c17\nparent 5e0721841e217cd394cbbd12e0c930c317139a0a\nauthor Eksperimental <eksperimental@autistici.org> 1651473729 +0000\ncommitter GitHub <noreply@github.com> 1651473729 +0200\n\nUpdate Copyright owners to manpages. (#11792)\n\n"
           }
         },
         "url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1",
         "html_url" =>
           "https://github.com/elixir-lang/elixir/commit/2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/2c70bd4fa053ffef1bbdb8a664b5bdf986cb25f1/comments",
         "author" => %{
           "login" => "eksperimental",
           "id" => 9_133_420,
           "node_id" => "MDQ6VXNlcjkxMzM0MjA=",
           "avatar_url" => "https://avatars.githubusercontent.com/u/9133420?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/eksperimental",
           "html_url" => "https://github.com/eksperimental",
           "followers_url" => "https://api.github.com/users/eksperimental/followers",
           "following_url" =>
             "https://api.github.com/users/eksperimental/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/eksperimental/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/eksperimental/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/eksperimental/subscriptions",
           "organizations_url" => "https://api.github.com/users/eksperimental/orgs",
           "repos_url" => "https://api.github.com/users/eksperimental/repos",
           "events_url" => "https://api.github.com/users/eksperimental/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/eksperimental/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "committer" => %{
           "login" => "web-flow",
           "id" => 19_864_447,
           "node_id" => "MDQ6VXNlcjE5ODY0NDQ3",
           "avatar_url" => "https://avatars.githubusercontent.com/u/19864447?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/web-flow",
           "html_url" => "https://github.com/web-flow",
           "followers_url" => "https://api.github.com/users/web-flow/followers",
           "following_url" => "https://api.github.com/users/web-flow/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/web-flow/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/web-flow/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/web-flow/subscriptions",
           "organizations_url" => "https://api.github.com/users/web-flow/orgs",
           "repos_url" => "https://api.github.com/users/web-flow/repos",
           "events_url" => "https://api.github.com/users/web-flow/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/web-flow/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "parents" => [
           %{
             "sha" => "5e0721841e217cd394cbbd12e0c930c317139a0a",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/commits/5e0721841e217cd394cbbd12e0c930c317139a0a",
             "html_url" =>
               "https://github.com/elixir-lang/elixir/commit/5e0721841e217cd394cbbd12e0c930c317139a0a"
           }
         ]
       },
       %{
         "sha" => "5e0721841e217cd394cbbd12e0c930c317139a0a",
         "node_id" => "C_kwDOABLXGtoAKDVlMDcyMTg0MWUyMTdjZDM5NGNiYmQxMmUwYzkzMGMzMTcxMzlhMGE",
         "commit" => %{
           "author" => %{
             "name" => "Kai",
             "email" => "kw7oe@users.noreply.github.com",
             "date" => "2022-05-01T15:45:10Z"
           },
           "committer" => %{
             "name" => "GitHub",
             "email" => "noreply@github.com",
             "date" => "2022-05-01T15:45:10Z"
           },
           "message" => "Add ExUnit.run/1 to rerun test modules (#11788)",
           "tree" => %{
             "sha" => "5ebb5f0072f95332f88b738a7d5f3b3f2b091747",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/git/trees/5ebb5f0072f95332f88b738a7d5f3b3f2b091747"
           },
           "url" =>
             "https://api.github.com/repos/elixir-lang/elixir/git/commits/5e0721841e217cd394cbbd12e0c930c317139a0a",
           "comment_count" => 0,
           "verification" => %{
             "verified" => true,
             "reason" => "valid",
             "signature" =>
               "-----BEGIN PGP SIGNATURE-----\n\nwsBcBAABCAAQBQJibqsGCRBK7hj4Ov3rIwAA90wIAJNpVPkYJEn4IfeBe3haoa2l\nIGo9o9SjAg6uR8TiriZXBCQNrF1hKuTihLXvpUq7qgiI77E38JBYeCDsPRNx5hRo\n1LIqHJb2esdClqmjLBbo70xZJV/tWa4Q4JQoY1hNubefZ7bTyElvIU34a/oUzc0S\nUGPEyXjP3UqXKSP4ySxQqd0WtcEj3jKAOZhM/i6SubAHa16XIhw5NT9yhaeNOoh6\nfXokYRTn/O9LgRaz6TTpC6fEUq9atNSOfzJGHtmaccSg9UoQhLMFvmEZ/vpYUF9D\nNOoLlwHuNV41Qzxyj0X2ZQop2VU1UIYNH5GGSAMOWdgYXb7JrTuePVRR2M6TaxU=\n=bZfI\n-----END PGP SIGNATURE-----\n",
             "payload" =>
               "tree 5ebb5f0072f95332f88b738a7d5f3b3f2b091747\nparent 3ba538113e9da41c42585266548024c7e18baea2\nauthor Kai <kw7oe@users.noreply.github.com> 1651419910 +0800\ncommitter GitHub <noreply@github.com> 1651419910 +0200\n\nAdd ExUnit.run/1 to rerun test modules (#11788)\n\n"
           }
         },
         "url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/5e0721841e217cd394cbbd12e0c930c317139a0a",
         "html_url" =>
           "https://github.com/elixir-lang/elixir/commit/5e0721841e217cd394cbbd12e0c930c317139a0a",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/commits/5e0721841e217cd394cbbd12e0c930c317139a0a/comments",
         "author" => %{
           "login" => "kw7oe",
           "id" => 12_683_067,
           "node_id" => "MDQ6VXNlcjEyNjgzMDY3",
           "avatar_url" => "https://avatars.githubusercontent.com/u/12683067?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/kw7oe",
           "html_url" => "https://github.com/kw7oe",
           "followers_url" => "https://api.github.com/users/kw7oe/followers",
           "following_url" => "https://api.github.com/users/kw7oe/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/kw7oe/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/kw7oe/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/kw7oe/subscriptions",
           "organizations_url" => "https://api.github.com/users/kw7oe/orgs",
           "repos_url" => "https://api.github.com/users/kw7oe/repos",
           "events_url" => "https://api.github.com/users/kw7oe/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/kw7oe/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "committer" => %{
           "login" => "web-flow",
           "id" => 19_864_447,
           "node_id" => "MDQ6VXNlcjE5ODY0NDQ3",
           "avatar_url" => "https://avatars.githubusercontent.com/u/19864447?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/web-flow",
           "html_url" => "https://github.com/web-flow",
           "followers_url" => "https://api.github.com/users/web-flow/followers",
           "following_url" => "https://api.github.com/users/web-flow/following%{/other_user}",
           "gists_url" => "https://api.github.com/users/web-flow/gists%{/gist_id}",
           "starred_url" => "https://api.github.com/users/web-flow/starred%{/owner}%{/repo}",
           "subscriptions_url" => "https://api.github.com/users/web-flow/subscriptions",
           "organizations_url" => "https://api.github.com/users/web-flow/orgs",
           "repos_url" => "https://api.github.com/users/web-flow/repos",
           "events_url" => "https://api.github.com/users/web-flow/events%{/privacy}",
           "received_events_url" => "https://api.github.com/users/web-flow/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "parents" => [
           %{
             "sha" => "3ba538113e9da41c42585266548024c7e18baea2",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/commits/3ba538113e9da41c42585266548024c7e18baea2",
             "html_url" =>
               "https://github.com/elixir-lang/elixir/commit/3ba538113e9da41c42585266548024c7e18baea2"
           }
         ]
       }
     ]}
  end
end
