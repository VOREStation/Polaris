/datum/unit_test/communicator_get_recent_news
	name = "OBJ: communicator.get_recent_news()"

/datum/unit_test/communicator_get_recent_news/start_test()
	// First populate news networks with test data
	for(var/datum/feed_channel/channel in news_network.network_channels)
		channel.clear()
	news_network.SubmitArticle("Msg 1", "Billy Bob", "Station Announcements", null, FALSE, "Story")
	news_network.SubmitArticle("Msg 2", "Billy Bob", "Station Announcements", null, FALSE, "Story")
	news_network.SubmitArticle("Msg 3", "Billy Bob", "Station Announcements", null, FALSE, "Story")
	news_network.SubmitArticle("Msg 4", "Billy Bob", "Station Announcements", null, FALSE, "Story")

	/obj/item/device/communicator/C = new
	var/list/RN = C.get_recent_news()

	if (RN.len == 3)
		pass("get_recent_news() returns only three news articles")
	else
		fail("get_recent_news() returned [R.len] news articles instead of 3.")

	qdel(C)
	return 1
