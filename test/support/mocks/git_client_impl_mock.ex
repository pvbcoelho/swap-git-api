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
         "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11793",
         "repository_url" => "https://api.github.com/repos/elixir-lang/elixir",
         "labels_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11793/labels%SwapGitApi.Domain.Entities.Contributor{/name}",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11793/comments",
         "events_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11793/events",
         "html_url" => "https://github.com/elixir-lang/elixir/pull/11793",
         "id" => 1_222_490_098,
         "node_id" => "PR_kwDOABLXGs43JaIQ",
         "number" => 11793,
         "title" => "GenServer=> Rename `continue` argument in handle_continue/2",
         "user" => %{
           "login" => "eksperimental",
           "id" => 9_133_420,
           "node_id" => "MDQ6VXNlcjkxMzM0MjA=",
           "avatar_url" => "https://avatars.githubusercontent.com/u/9133420?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/eksperimental",
           "html_url" => "https://github.com/eksperimental",
           "followers_url" => "https://api.github.com/users/eksperimental/followers",
           "following_url" =>
             "https://api.github.com/users/eksperimental/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
           "gists_url" =>
             "https://api.github.com/users/eksperimental/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
           "starred_url" =>
             "https://api.github.com/users/eksperimental/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
           "subscriptions_url" => "https://api.github.com/users/eksperimental/subscriptions",
           "organizations_url" => "https://api.github.com/users/eksperimental/orgs",
           "repos_url" => "https://api.github.com/users/eksperimental/repos",
           "events_url" =>
             "https://api.github.com/users/eksperimental/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
           "received_events_url" => "https://api.github.com/users/eksperimental/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "labels" => [],
         "state" => "open",
         "locked" => false,
         "assignee" => nil,
         "assignees" => [],
         "milestone" => nil,
         "comments" => 4,
         "created_at" => "2022-05-02T05:14:14Z",
         "updated_at" => "2022-05-02T11:41:58Z",
         "closed_at" => nil,
         "author_association" => "CONTRIBUTOR",
         "active_lock_reason" => nil,
         "draft" => false,
         "pull_request" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/pulls/11793",
           "html_url" => "https://github.com/elixir-lang/elixir/pull/11793",
           "diff_url" => "https://github.com/elixir-lang/elixir/pull/11793.diff",
           "patch_url" => "https://github.com/elixir-lang/elixir/pull/11793.patch",
           "merged_at" => nil
         },
         "body" =>
           "As I was reading the docs, it was not clear what the `continue` argument\r\nwas just by reading its name.\r\n\r\nhandle_call and handle_cast use `request` for a similar argument,\r\nso I unified it.",
         "reactions" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11793/reactions",
           "total_count" => 0,
           "+1" => 0,
           "-1" => 0,
           "laugh" => 0,
           "hooray" => 0,
           "confused" => 0,
           "heart" => 0,
           "rocket" => 0,
           "eyes" => 0
         },
         "timeline_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11793/timeline",
         "performed_via_github_app" => nil
       },
       %{
         "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11785",
         "repository_url" => "https://api.github.com/repos/elixir-lang/elixir",
         "labels_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11785/labels%SwapGitApi.Domain.Entities.Contributor{/name}",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11785/comments",
         "events_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11785/events",
         "html_url" => "https://github.com/elixir-lang/elixir/issues/11785",
         "id" => 1_217_262_051,
         "node_id" => "I_kwDOABLXGs5IjfHj",
         "number" => 11785,
         "title" => "inet_gethost.exe path error",
         "user" => %{
           "login" => "kotsius",
           "id" => 35_947_133,
           "node_id" => "MDQ6VXNlcjM1OTQ3MTMz",
           "avatar_url" => "https://avatars.githubusercontent.com/u/35947133?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/kotsius",
           "html_url" => "https://github.com/kotsius",
           "followers_url" => "https://api.github.com/users/kotsius/followers",
           "following_url" =>
             "https://api.github.com/users/kotsius/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
           "gists_url" =>
             "https://api.github.com/users/kotsius/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
           "starred_url" =>
             "https://api.github.com/users/kotsius/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
           "subscriptions_url" => "https://api.github.com/users/kotsius/subscriptions",
           "organizations_url" => "https://api.github.com/users/kotsius/orgs",
           "repos_url" => "https://api.github.com/users/kotsius/repos",
           "events_url" =>
             "https://api.github.com/users/kotsius/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
           "received_events_url" => "https://api.github.com/users/kotsius/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "labels" => [],
         "state" => "open",
         "locked" => false,
         "assignee" => nil,
         "assignees" => [],
         "milestone" => nil,
         "comments" => 20,
         "created_at" => "2022-04-27T12:09:16Z",
         "updated_at" => "2022-04-28T19:10:50Z",
         "closed_at" => nil,
         "author_association" => "NONE",
         "active_lock_reason" => nil,
         "body" =>
           "### Environment\r\n\r\n• Erlang/OTP 24⦗.3.3⦘ [erts-12.3.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]\r\n• Elixir 1.13.4 (compiled with Erlang/OTP 22)\r\n• Windows 10 Pro v20H2\r\n\r\n### Current behavior\r\n\r\n\"elixir myFile.exs\", \"mix ecto.create\", \"mix ecto.migrate\" output:\r\n\r\nC:\\Program Unknown option \"Files\\+Programming\\Erlang\\erts-12.3.1\\bin\\inet_gethost.exe\"\r\nUsage=> C:\\Program [-d [-d ...]] [-g ‹greedy threshold›] [‹number of workers›]\r\n\r\n### Expected behavior\r\n\r\nNo error message. Calling inet_gethost.exe should be able to handle the space in 'Program Files'.\r\nI guess that the solution would involve placing the inet_gethost execution path inside quotes.",
         "reactions" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11785/reactions",
           "total_count" => 0,
           "+1" => 0,
           "-1" => 0,
           "laugh" => 0,
           "hooray" => 0,
           "confused" => 0,
           "heart" => 0,
           "rocket" => 0,
           "eyes" => 0
         },
         "timeline_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11785/timeline",
         "performed_via_github_app" => nil
       },
       %{
         "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11763",
         "repository_url" => "https://api.github.com/repos/elixir-lang/elixir",
         "labels_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11763/labels%SwapGitApi.Domain.Entities.Contributor{/name}",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11763/comments",
         "events_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11763/events",
         "html_url" => "https://github.com/elixir-lang/elixir/pull/11763",
         "id" => 1_207_214_581,
         "node_id" => "PR_kwDOABLXGs42XsqZ",
         "number" => 11763,
         "title" => "feat=> allow app environment values to contain spaces",
         "user" => %{
           "login" => "thalesmg",
           "id" => 16_166_434,
           "node_id" => "MDQ6VXNlcjE2MTY2NDM0",
           "avatar_url" => "https://avatars.githubusercontent.com/u/16166434?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/thalesmg",
           "html_url" => "https://github.com/thalesmg",
           "followers_url" => "https://api.github.com/users/thalesmg/followers",
           "following_url" =>
             "https://api.github.com/users/thalesmg/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
           "gists_url" =>
             "https://api.github.com/users/thalesmg/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
           "starred_url" =>
             "https://api.github.com/users/thalesmg/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
           "subscriptions_url" => "https://api.github.com/users/thalesmg/subscriptions",
           "organizations_url" => "https://api.github.com/users/thalesmg/orgs",
           "repos_url" => "https://api.github.com/users/thalesmg/repos",
           "events_url" =>
             "https://api.github.com/users/thalesmg/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
           "received_events_url" => "https://api.github.com/users/thalesmg/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "labels" => [],
         "state" => "open",
         "locked" => false,
         "assignee" => nil,
         "assignees" => [],
         "milestone" => nil,
         "comments" => 8,
         "created_at" => "2022-04-18T16:28:34Z",
         "updated_at" => "2022-04-24T16:13:49Z",
         "closed_at" => nil,
         "author_association" => "CONTRIBUTOR",
         "active_lock_reason" => nil,
         "draft" => false,
         "pull_request" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/pulls/11763",
           "html_url" => "https://github.com/elixir-lang/elixir/pull/11763",
           "diff_url" => "https://github.com/elixir-lang/elixir/pull/11763.diff",
           "patch_url" => "https://github.com/elixir-lang/elixir/pull/11763.patch",
           "merged_at" => nil
         },
         "body" =>
           "When one needs to set an application environment value that contains\r\nspaces, such as a Mnesia directory path with spaces, the current\r\n`--erl` switch does not pass the spaces correctly down to `erl`:\r\n\r\n```\r\nͳ bin/iex --erl \"-mnesia dir \\\"/tmp/abc/with spaces/\\\"\" -e ':init.get_arguments()[:mnesia] |> IO.inspect(); System.halt()'\r\nErlang/OTP 24 [erts-12.1.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]\r\n\r\n['dir', '\"/tmp/abc/with', 'spaces/\"']\r\n```\r\n\r\nWhich fails when loading the app:\r\n\r\n```\r\niex(1)> Application.load(:mnesia)\r\n\r\n13:26:44.461 [error] application_controller=> unterminated string starting with \"/tmp/abc/with\"=> \"/tmp/abc/with\r\n\r\n%SwapGitApi.Domain.Entities.Contributor{:error,%{:bad_environment_value, '\"/tmp/abc/with'}}\r\n```\r\n\r\nThis adds a new switch, `--app-env`, that helps with setting such\r\nvalues while preserving both the double quotes needed for Erlang to\r\nparse the value as a string and the spaces that might be in such\r\nstring.\r\n\r\n```\r\nͳ bin/iex --app-env mnesia dir \"\\\"/tmp/abc/with spaces/\\\"\" -e ':init.get_arguments()[:mnesia] |> IO.inspect(); System.halt()'\r\nErlang/OTP 24 [erts-12.1.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]\r\n\r\n['dir', '\"/tmp/abc/with spaces/\"']\r\n```",
         "reactions" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11763/reactions",
           "total_count" => 1,
           "+1" => 1,
           "-1" => 0,
           "laugh" => 0,
           "hooray" => 0,
           "confused" => 0,
           "heart" => 0,
           "rocket" => 0,
           "eyes" => 0
         },
         "timeline_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11763/timeline",
         "performed_via_github_app" => nil
       },
       %{
         "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11753",
         "repository_url" => "https://api.github.com/repos/elixir-lang/elixir",
         "labels_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11753/labels%SwapGitApi.Domain.Entities.Contributor{/name}",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11753/comments",
         "events_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11753/events",
         "html_url" => "https://github.com/elixir-lang/elixir/issues/11753",
         "id" => 1_199_093_072,
         "node_id" => "I_kwDOABLXGs5HeLVQ",
         "number" => 11753,
         "title" => "Automatically perform NFC + additions for identifiers",
         "user" => %{
           "login" => "josevalim",
           "id" => 9582,
           "node_id" => "MDQ6VXNlcjk1ODI=",
           "avatar_url" => "https://avatars.githubusercontent.com/u/9582?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/josevalim",
           "html_url" => "https://github.com/josevalim",
           "followers_url" => "https://api.github.com/users/josevalim/followers",
           "following_url" =>
             "https://api.github.com/users/josevalim/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
           "gists_url" =>
             "https://api.github.com/users/josevalim/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
           "starred_url" =>
             "https://api.github.com/users/josevalim/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
           "subscriptions_url" => "https://api.github.com/users/josevalim/subscriptions",
           "organizations_url" => "https://api.github.com/users/josevalim/orgs",
           "repos_url" => "https://api.github.com/users/josevalim/repos",
           "events_url" =>
             "https://api.github.com/users/josevalim/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
           "received_events_url" => "https://api.github.com/users/josevalim/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "labels" => [
           %{
             "id" => 207_979,
             "node_id" => "MDU6TGFiZWwyMDc5Nzk=",
             "url" => "https://api.github.com/repos/elixir-lang/elixir/labels/Kind:Chore",
             "name" => "Kind:Chore",
             "color" => "fbca04",
             "default" => false,
             "description" => nil
           },
           %{
             "id" => 1_000_549_131,
             "node_id" => "MDU6TGFiZWwxMDAwNTQ5MTMx",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/labels/App:Elixir%20(compiler)",
             "name" => "App:Elixir (compiler)",
             "color" => "CCCCCC",
             "default" => false,
             "description" => ""
           }
         ],
         "state" => "open",
         "locked" => false,
         "assignee" => nil,
         "assignees" => [],
         "milestone" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/milestones/30",
           "html_url" => "https://github.com/elixir-lang/elixir/milestone/30",
           "labels_url" => "https://api.github.com/repos/elixir-lang/elixir/milestones/30/labels",
           "id" => 7_596_652,
           "node_id" => "MI_kwDOABLXGs4Ac-ps",
           "number" => 30,
           "title" => "v1.14",
           "description" => "",
           "creator" => %{
             "login" => "josevalim",
             "id" => 9582,
             "node_id" => "MDQ6VXNlcjk1ODI=",
             "avatar_url" => "https://avatars.githubusercontent.com/u/9582?v=4",
             "gravatar_id" => "",
             "url" => "https://api.github.com/users/josevalim",
             "html_url" => "https://github.com/josevalim",
             "followers_url" => "https://api.github.com/users/josevalim/followers",
             "following_url" =>
               "https://api.github.com/users/josevalim/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
             "gists_url" =>
               "https://api.github.com/users/josevalim/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
             "starred_url" =>
               "https://api.github.com/users/josevalim/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
             "subscriptions_url" => "https://api.github.com/users/josevalim/subscriptions",
             "organizations_url" => "https://api.github.com/users/josevalim/orgs",
             "repos_url" => "https://api.github.com/users/josevalim/repos",
             "events_url" =>
               "https://api.github.com/users/josevalim/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
             "received_events_url" => "https://api.github.com/users/josevalim/received_events",
             "type" => "User",
             "site_admin" => false
           },
           "open_issues" => 3,
           "closed_issues" => 7,
           "state" => "open",
           "created_at" => "2022-01-21T11:30:48Z",
           "updated_at" => "2022-04-21T13:06:48Z",
           "due_on" => "2022-05-31T07:00:00Z",
           "closed_at" => nil
         },
         "comments" => 1,
         "created_at" => "2022-04-10T16:34:11Z",
         "updated_at" => "2022-04-26T12:25:51Z",
         "closed_at" => nil,
         "author_association" => "MEMBER",
         "active_lock_reason" => nil,
         "body" =>
           "We should perform NFC normalization by default and provide a mechanism for additional normalizations (NFKC or others). At first, the only normalization we will perform is latin micro to greek mu found in NFKC. For the normalization, we will change the scriptset of the target letter (in this case, greek mu) to be the union of the scriptset of origin and target characters. Given latin mu is top, the result in this case is top too. This can be implemented programatically.\r\n\r\nThis rule will help us in the future if we want to handle things like converting Latin epsilon to Greek epsilon, but still distinguishing them from the Ukrainian epsilon-like character.\r\n\r\nWe should also improve the error messages for non-NFKC characters. If we have an invalid token, we can apply NFKC and try to parse it again. If it succeeds, the error message can tell the user how to properly write the identifier. This should be fully done on `elixir_tokenizer.erl` for now.\r\n\r\nOverall, we will have three distinct tasks:\r\n\r\n  * [ ] Apply NFC automatically instead of raising\r\n  * [ ] Support additional normalizations as explained above\r\n  * [ ] Improve error messages for identifiers not written in NFKC\r\n\r\nSee discussion in #11751. /cc @mrluc ",
         "reactions" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11753/reactions",
           "total_count" => 0,
           "+1" => 0,
           "-1" => 0,
           "laugh" => 0,
           "hooray" => 0,
           "confused" => 0,
           "heart" => 0,
           "rocket" => 0,
           "eyes" => 0
         },
         "timeline_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11753/timeline",
         "performed_via_github_app" => nil
       },
       %{
         "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11744",
         "repository_url" => "https://api.github.com/repos/elixir-lang/elixir",
         "labels_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11744/labels%SwapGitApi.Domain.Entities.Contributor{/name}",
         "comments_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11744/comments",
         "events_url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11744/events",
         "html_url" => "https://github.com/elixir-lang/elixir/issues/11744",
         "id" => 1_195_723_504,
         "node_id" => "I_kwDOABLXGs5HRUrw",
         "number" => 11744,
         "title" =>
           "Possible bug in compiler emitted warnings about incompatibles types in guard",
         "user" => %{
           "login" => "lud",
           "id" => 637_632,
           "node_id" => "MDQ6VXNlcjYzNzYzMg==",
           "avatar_url" => "https://avatars.githubusercontent.com/u/637632?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/lud",
           "html_url" => "https://github.com/lud",
           "followers_url" => "https://api.github.com/users/lud/followers",
           "following_url" =>
             "https://api.github.com/users/lud/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
           "gists_url" =>
             "https://api.github.com/users/lud/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
           "starred_url" =>
             "https://api.github.com/users/lud/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
           "subscriptions_url" => "https://api.github.com/users/lud/subscriptions",
           "organizations_url" => "https://api.github.com/users/lud/orgs",
           "repos_url" => "https://api.github.com/users/lud/repos",
           "events_url" =>
             "https://api.github.com/users/lud/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
           "received_events_url" => "https://api.github.com/users/lud/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "labels" => [
           %{
             "id" => 207_974,
             "node_id" => "MDU6TGFiZWwyMDc5NzQ=",
             "url" => "https://api.github.com/repos/elixir-lang/elixir/labels/Kind:Bug",
             "name" => "Kind:Bug",
             "color" => "e10c02",
             "default" => false,
             "description" => nil
           },
           %{
             "id" => 2_660_471_585,
             "node_id" => "MDU6TGFiZWwyNjYwNDcxNTg1",
             "url" =>
               "https://api.github.com/repos/elixir-lang/elixir/labels/App:Elixir%20(checker)",
             "name" => "App:Elixir (checker)",
             "color" => "CCCCCC",
             "default" => false,
             "description" => ""
           }
         ],
         "state" => "open",
         "locked" => false,
         "assignee" => %{
           "login" => "ericmj",
           "id" => 316_890,
           "node_id" => "MDQ6VXNlcjMxNjg5MA==",
           "avatar_url" => "https://avatars.githubusercontent.com/u/316890?v=4",
           "gravatar_id" => "",
           "url" => "https://api.github.com/users/ericmj",
           "html_url" => "https://github.com/ericmj",
           "followers_url" => "https://api.github.com/users/ericmj/followers",
           "following_url" =>
             "https://api.github.com/users/ericmj/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
           "gists_url" =>
             "https://api.github.com/users/ericmj/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
           "starred_url" =>
             "https://api.github.com/users/ericmj/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
           "subscriptions_url" => "https://api.github.com/users/ericmj/subscriptions",
           "organizations_url" => "https://api.github.com/users/ericmj/orgs",
           "repos_url" => "https://api.github.com/users/ericmj/repos",
           "events_url" =>
             "https://api.github.com/users/ericmj/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
           "received_events_url" => "https://api.github.com/users/ericmj/received_events",
           "type" => "User",
           "site_admin" => false
         },
         "assignees" => [
           %{
             "login" => "ericmj",
             "id" => 316_890,
             "node_id" => "MDQ6VXNlcjMxNjg5MA==",
             "avatar_url" => "https://avatars.githubusercontent.com/u/316890?v=4",
             "gravatar_id" => "",
             "url" => "https://api.github.com/users/ericmj",
             "html_url" => "https://github.com/ericmj",
             "followers_url" => "https://api.github.com/users/ericmj/followers",
             "following_url" =>
               "https://api.github.com/users/ericmj/following%SwapGitApi.Domain.Entities.Contributor{/other_user}",
             "gists_url" =>
               "https://api.github.com/users/ericmj/gists%SwapGitApi.Domain.Entities.Contributor{/gist_id}",
             "starred_url" =>
               "https://api.github.com/users/ericmj/starred%SwapGitApi.Domain.Entities.Contributor{/owner}%SwapGitApi.Domain.Entities.Contributor{/repo}",
             "subscriptions_url" => "https://api.github.com/users/ericmj/subscriptions",
             "organizations_url" => "https://api.github.com/users/ericmj/orgs",
             "repos_url" => "https://api.github.com/users/ericmj/repos",
             "events_url" =>
               "https://api.github.com/users/ericmj/events%SwapGitApi.Domain.Entities.Contributor{/privacy}",
             "received_events_url" => "https://api.github.com/users/ericmj/received_events",
             "type" => "User",
             "site_admin" => false
           }
         ],
         "milestone" => nil,
         "comments" => 6,
         "created_at" => "2022-04-07T08:49:00Z",
         "updated_at" => "2022-04-10T16:36:09Z",
         "closed_at" => nil,
         "author_association" => "NONE",
         "active_lock_reason" => nil,
         "body" =>
           "```\r\nErlang/OTP 24 [erts-12.2.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit]\r\n\r\nElixir 1.13.3 (compiled with Erlang/OTP 24)\r\n```\r\n\r\nPlease have a look at this demo code, notably the `defguard` call and how it is used:\r\n\r\n```elixir\r\ndefmodule SomeGood do\r\n  defstruct dummy=> nil\r\nend\r\n\r\ndefmodule Demo do\r\n  @good_modules [Somegood]\r\n\r\n  defguard is_good(mod_or_struct)\r\n           when (is_atom(mod_or_struct) and mod_or_struct in @good_modules) or\r\n                  (is_map(mod_or_struct) and is_map_key(mod_or_struct, :__struct__) and\r\n                     :erlang.map_get(:__struct__, mod_or_struct) in @good_modules)\r\n\r\n  defguard is_bad(mod_or_struct) when not is_good(mod_or_struct)\r\nend\r\n\r\ndefmodule Worker do\r\n  import Demo\r\n\r\n  def work(%contract%SwapGitApi.Domain.Entities.Contributor{}) when is_good(contract) do\r\n    :alright\r\n  end\r\n\r\n  def work(_) do\r\n    :nope\r\n  end\r\n\r\n  def a_case(data) do\r\n    case data do\r\n      %contract%SwapGitApi.Domain.Entities.Contributor{} when is_good(contract) -> :good_contract\r\n      data when is_good(data) -> :good_data\r\n      _other -> :bad_data\r\n    end\r\n  end\r\nend\r\n\r\ndefmodule Dependent do\r\n  require Demo\r\n\r\n  def get_fun do\r\n    fn\r\n      %contract%SwapGitApi.Domain.Entities.Contributor{} when Demo.is_bad(contract) -> :nope\r\n      _ -> :alright\r\n    end\r\n  end\r\nend\r\n```\r\n\r\nIt produces the following warnings:\r\n\r\n```\r\nwarning=> expected Kernel.is_map_key/2 to have signature:\r\n\r\n    :__struct__, atom() -> dynamic()\r\n\r\nbut it has signature:\r\n\r\n    dynamic(), %%SwapGitApi.Domain.Entities.Contributor{optional(dynamic()) => dynamic()} -> dynamic()\r\n\r\nin expression:\r\n\r\n    # lib/demo.ex:41\r\n    is_map_key(contract, :__struct__)\r\n\r\nConflict found at\r\n  lib/demo.ex:41=> Dependent.get_fun/0\r\n\r\nwarning=> incompatible types:\r\n\r\n    atom() !~ map()\r\n\r\nin expression:\r\n\r\n    # lib/demo.ex:19\r\n    is_map(contract)\r\n\r\nwhere \"contract\" was given the type atom() in:\r\n\r\n    # lib/demo.ex:19\r\n    %contract%SwapGitApi.Domain.Entities.Contributor{}\r\n\r\nwhere \"contract\" was given the type map() in:\r\n\r\n    # lib/demo.ex:19\r\n    is_map(contract)\r\n\r\nConflict found at\r\n  lib/demo.ex:19=> Worker.work/1\r\n\r\nwarning=> incompatible types:\r\n\r\n    atom() !~ map()\r\n\r\nin expression:\r\n\r\n    # lib/demo.ex:29\r\n    is_map(contract)\r\n\r\nwhere \"contract\" was given the type atom() in:\r\n\r\n    # lib/demo.ex:29\r\n    %contract%SwapGitApi.Domain.Entities.Contributor{}\r\n\r\nwhere \"contract\" was given the type map() in:\r\n\r\n    # lib/demo.ex:29\r\n    is_map(contract)\r\n\r\nConflict found at\r\n  lib/demo.ex:29=> Worker.a_case/1\r\n\r\n```\r\nBut to me it looks like the guards are fine.\r\n\r\nThe main guard is defined as is instead of using `is_struct` because I was trying to find why there was such warnings.\r\n\r\nThe warning about `expected Kernel.is_map_key/2 to have signature` is caused by the usage of the guard defined as `defguard is_bad(mod_or_struct) when not is_good(mod_or_struct)` only.",
         "reactions" => %{
           "url" => "https://api.github.com/repos/elixir-lang/elixir/issues/11744/reactions",
           "total_count" => 0,
           "+1" => 0,
           "-1" => 0,
           "laugh" => 0,
           "hooray" => 0,
           "confused" => 0,
           "heart" => 0,
           "rocket" => 0,
           "eyes" => 0
         },
         "timeline_url" =>
           "https://api.github.com/repos/elixir-lang/elixir/issues/11744/timeline",
         "performed_via_github_app" => nil
       }
     ]}
  end
end
