package com.agribiolab.testsupport;

import org.junit.jupiter.api.Assumptions;

public final class DaoTestSupport {
    private DaoTestSupport() {
    }

    public static void assumeDatabaseConfigured() {
        String url = config("agricomp.db.url", "AGRICOMP_DB_URL");
        String user = config("agricomp.db.user", "AGRICOMP_DB_USER");

        Assumptions.assumeTrue(
            hasText(url) && hasText(user),
            "Database settings are not configured. Set AGRICOMP_DB_URL and AGRICOMP_DB_USER, or agricomp.db.url and agricomp.db.user."
        );
    }

    private static String config(String propertyName, String envName) {
        String value = System.getProperty(propertyName);
        if (hasText(value)) {
            return value;
        }
        return System.getenv(envName);
    }

    private static boolean hasText(String value) {
        return value != null && !value.trim().isEmpty();
    }
}
