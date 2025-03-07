test_that("datasus pop uf general is consistent", {
  res <- uf_pop_age(source = "datasus") %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("ufrn pop uf general is consistent", {
  res <- uf_pop_age(source = "ufrn") %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

test_that("datasus2024 pop uf general is consistent", {
  res <- uf_pop_age(source = "datasus2024") %>%
    dplyr::group_by(year, age_group) %>%
    dplyr::summarise(freq = sum(pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::group_by(freq) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    dplyr::filter(count > 1)

  expect_equal(nrow(res), 0)
})

